import React from "react";
import ReactDOM  from "react-dom";
import MyProperties from "./myProperties";

document.addEventListener("DOMContentLoaded", () => {
    ReactDOM.render(
        <MyProperties />,
        document.body.appendChild(document.createElement("div")),
    )
});