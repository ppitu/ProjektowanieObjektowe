import axios from "axios";
import { useEffect, useState } from "react";

function Payments() {
    const [payment, setPayment] = useState("");


    const handleChange = e => {
        setPayment({number: e.target.value})
    }

    const handleSubmit = e => {
        e.preventDefault();

        axios.post(`http://localhost:1323/orders`, payment)
        .then(res => {
            console.log(res);
            console.log(res.data);
        })
    }
    return (
        <div>
        <form onSubmit={handleSubmit}>
        <label>
          Number karty
          <input type="text" name="name" onChange={handleChange} />
        </label>
        <button type="submit">Płatność</button>
        </form>
        </div>
    )
}

export default Payments;