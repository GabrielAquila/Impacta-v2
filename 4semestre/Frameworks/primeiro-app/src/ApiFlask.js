import React, { useState, useEffect } from "react";

export default function ApiFlask() {
  const [jsonData, setJsonData] = useState([]);

  const getApiData = async () => {
      const data = await fetch("http://127.0.0.1:5000/api/json", {
        mode: "cors"
      }).then((response) => response.json());
      setJsonData(data);
    } 

  useEffect(() => {
    getApiData();
  }, []);

  return (
    <div className="flask-container">
      {jsonData && jsonData.map((data) => (
        <div className="flask-item" key={data.rg}>
          <h3>Retorno Json</h3>
          <p>Nome: {data.nome}</p>
          <p>Idade: {data.idade}</p>
          <p>RG: {data.rg}</p>
        </div>
      ))}
    </div>
  );
}
