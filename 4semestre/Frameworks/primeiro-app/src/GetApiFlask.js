import React, { useState, useEffect } from "react";

export default function GetApiFlask() {
  const [jsonData, setJsonData] = useState([]);
  const [error, setError] = useState(false);

  const getApiData = async () => {
    try {
      const response = await fetch("http://127.0.0.1:5000/api/json", {
        mode: "cors"
      });
      if (!response.ok) {
        throw new Error("Erro na requisição");
      }
      const data = await response.json();
      setJsonData(data);
      setError(false);
    } catch (error) {
      setError(true);
      console.error(error);
    }
  };

  useEffect(() => {
    getApiData();
  }, []);

  return (
    <div className="flask-container">
      {error && (
        <div className="flask-error">
          <h3>Ocorreu um erro na requisição</h3>
        </div>
      )}
      {!error &&
        jsonData.map((data) => (
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