import React from 'react';
import { Link } from 'react-router-dom';
import '../assets/css/CategoryNav.css';
import '../assets/css/global.css';
import { categoryList } from '../types';

function CategoryNav() {
    return (
        <div className="category-bar">
            <ul>
                {categoryList.map(category => (
                    <li
                        key={category.categoryId}
                        className={category.active ? "active" : ""}
                    >
                        <Link to={category.link}>{category.name}</Link>
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default CategoryNav;