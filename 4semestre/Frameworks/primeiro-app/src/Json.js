import React, { useState, useEffect } from 'react';

export default function Alunos(){

    const [users, setUsers] = useState();

    const getApiData = async () => {
        const response = await fetch(
          "https://jsonplaceholder.typicode.com/todos/"
        ).then((response) => response.json());
    
        setUsers(response);
      };

      useEffect(() => {
        getApiData();
      }, []);
return (


<div className="app">
{users && users.map((user) => (
  <div className="item-container">
    Id:{user.id} - Title: {user.title} 
  </div>
))}
</div>



   );
}