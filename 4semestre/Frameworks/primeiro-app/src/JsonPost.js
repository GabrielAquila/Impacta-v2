import React, { useState } from 'react';

function PostForm() {
  const [title, setTitle] = useState('');
  const [body, setBody] = useState('');
  const [userId, setUserId] = useState('');
  const [status, setStatus] = useState('');

  const handleSubmit = async (event) => {
    event.preventDefault();

    const response = await fetch('https://jsonplaceholder.typicode.com/posts', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: JSON.stringify({
        title: title,
        body: body,
        userId: userId
      })
    });

    const responseData = await response.json();

    if (response.ok) {
      setStatus(`Post criado com ID ${responseData.userId} e o titulo : ${responseData.title} `);
      setTitle('');
      setBody('');
      setUserId('');
    } else if (response.status === 400) {
      setStatus('Dados do formulário inválidos');
    } else if (response.status === 401) {
      setStatus('Você não está autorizado a criar um post');
    } else {
      setStatus('Ocorreu um erro ao criar o post');
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <label>
        Título:
        <input type="text" value={title} onChange={event => setTitle(event.target.value)} />
      </label>
      <br />
      <label>
        Corpo:
        <textarea value={body} onChange={event => setBody(event.target.value)} />
      </label>
      <br />
      <label>
        ID do usuário:
        <input type="number" value={userId} onChange={event => setUserId(event.target.value)} />
      </label>
      <br />
      <button type="submit" onClick={handleSubmit}>Enviar</button>
      {status && <p>{status}</p>}
    </form>
  );
}

export default PostForm;
