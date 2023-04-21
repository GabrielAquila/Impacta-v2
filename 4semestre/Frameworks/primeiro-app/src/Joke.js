import React, { useState, useEffect } from 'react';
import axios from 'axios';

function JokesList() {
  const [jokes, setJokes] = useState([]);

  useEffect(() => {
    const fetchJokes = async () => {
      const newJokes = [];
      for (let i = 0; i < 10; i++) {
        const response = await axios.get('https://v2.jokeapi.dev/joke/Any');
        const joke = response.data;
        newJokes.push(joke);
      }
      setJokes(newJokes);
    }
    fetchJokes();
  }, []);

  return (
    <div>
      <h1>Jokes List</h1>
      {jokes.map((joke, index) => (
        <div key={index}>
          <h2>{joke.category}</h2>
          {joke.type === 'single' ? (
            <p>{joke.joke}</p>
          ) : (
            <div>
              <p>{joke.setup}</p>
              <p>{joke.delivery}</p>
            </div>
          )}
        </div>
      ))}
    </div>
  );
}

export default JokesList;
