import React from "react";
import { Link } from "react-router-dom";

export default function Retorna (){
    // const location = useLocation();
    // const history = useHistory();
    // const { id } = useParams();
    return (
        <div>
            {/* <h1>Path: {location.pathname}</h1> */}
            <h1>Testando</h1>
            <Link to="/Retorna">retornar a página inicial</Link>
        </div> 
    );
}