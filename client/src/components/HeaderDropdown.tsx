import React from 'react';
import { Link, useLocation } from 'react-router-dom';
import '../assets/css/global.css';
import '../assets/css/HeaderDropdown.css';
import { categoryList } from '../types';

function HeaderDropdown() {
    const location = useLocation();
    const isCategoryPage = location.pathname.includes("category");

    return (
        <section>
            <div className="header-dropdown">
                <button className={`categories-button ${isCategoryPage ? 'active' : ''}`}>
                    Categories
                </button>
                <ul>
                    {categoryList.map((item, index) => (
                        <li key={index}>
                            <Link to={item.link}>{item.name}</Link>
                        </li>
                    ))}
                </ul>
            </div>
        </section>
    );
}

export default HeaderDropdown;
