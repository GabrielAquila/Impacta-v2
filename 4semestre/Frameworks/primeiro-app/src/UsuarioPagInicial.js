import React from 'react';
import faker from 'faker';
import { Link } from "react-router-dom";

function UserScreen() {
  const userData = {
    name: faker.name.findName(),
    email: faker.internet.email(),
    address: `${faker.address.streetName()}, ${faker.address.streetAddress()}, ${faker.address.city()}, ${faker.address.stateAbbr()} ${faker.address.zipCode()}`,
    phone: faker.phone.phoneNumber(),
    avatar: faker.image.avatar(),
  };

  return (
    <div className="container">
      <h1>Dados do Usuário</h1>
      <div className="user-info">
        <img src={userData.avatar} alt="Avatar do usuário" />
        <div className="user-details">
          <p><strong>Nome:</strong> {userData.name}</p>
          <p><strong>E-mail:</strong> {userData.email}</p>
          <p><strong>Endereço:</strong> {userData.address}</p>
          <p><strong>Telefone:</strong> {userData.phone}</p>
        </div>
      </div>
      <Link to="/">Retornar à página inicial</Link>
    </div>
  );
}

export default UserScreen;
