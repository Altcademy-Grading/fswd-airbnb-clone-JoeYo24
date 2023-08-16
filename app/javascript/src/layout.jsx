// layout.js
import React, { useState } from 'react';

const Layout = (props) => {
  return (
    <React.Fragment>
      <nav className="navbar navbar-expand navbar-light bg-light">
        <div className="container-fluid">
          <a className="navbar-brand text-danger" href="/">Airbnb</a>
          <div className="collapse navbar-collapse" id="navbarSupportedContent">
            <ul className="navbar-nav me-auto">
              <li className="nav-item">
                <a className="nav-link" href="/">Home</a>
              </li>
              <li className="nav-item ms-3">
                <a className="nav-link" href="/my_properties">My Properties</a>
              </li>
              <li className="nav-item ms-3">
                <a className="nav-link" href="/my_bookings">My Bookings</a>
              </li>
              <li className='nav-item ms-3'>
                <a className="nav-link" href="/login">Log in</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      {props.children}
      <footer className="p-3 bg-light">
        <div>
          <p className="me-3 mb-0 text-secondary">Airbnb Clone</p>
        </div>
      </footer>
    </React.Fragment>
  );
};

export default Layout;