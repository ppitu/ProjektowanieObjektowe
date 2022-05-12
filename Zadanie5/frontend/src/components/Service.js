import axios from "axios";
import { useEffect, useState } from "react";
import { createPortal } from "react-dom";
import {getServices} from "../RestRequester"
import Orders from "./Order";
import Payments from "./Payment";

function Services() {
    const [services, setService] = useState([]);
    
    useEffect(() => {
        getServices()
            .then(res => {
                setService(res.data)
            })
    }, [])

    

    return (
        <div className="services">
            <ul>
                {services.map((service, index) => (
                    <div key={index}>
                        <h3>{service.Name}</h3>
                        <p>{service.Description}</p>
                        <Orders />
                        <Payments />
                    </div>
                ))}
            </ul>
        </div>
    )
}

export default Services;