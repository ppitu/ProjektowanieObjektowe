import axios from "axios";

const serverURL = "http://localhost:1323";
const serviceURL = `${serverURL}/services`;

export const getServices = () => {
    return axios.get(serviceURL, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
            "Access-Control-Allow-Origin": "*"
        }
    })
}