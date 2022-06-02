import axios from "axios";
import useState from "react";

function Orders() {
    const [date, setDate] = useState("");

    const handleSubmit = e => {
        e.preventDefault();

        const currentDate = new Date();
        setDate(`${currentDate.getDate()}/${currentDate.getMonth()+1}/${currentDate.getFullYear()}`)

        const data = {date}

        axios.post(`http://localhost:1323/orders`, {data})
        .then(res => {
            console.log(res);
            console.log(res.data);
        })
    }
    return (
    <button type="submit" onClick={handleSubmit}>Zamów</button>
    )
}

export default Orders;