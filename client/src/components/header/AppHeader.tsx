import HeaderDropdown from '../HeaderDropdown';
import '../../assets/css/global.css'
import '../../assets/css/AppHeader.css';
import {Link, useLocation} from 'react-router-dom';
function AppHeader(){

return(
  <header>
    <div className="header-container">
      <div className="logo">
        <Link to="/">
          <img
              className="celestialLibraryLogo"
              src={require('../../assets/images/site/header/TheCelestialLibrary.png')}
              alt="The Celestial Library"
          />
        </Link>
      </div>
      <div className="search-wrapper">
        <div className="search-left">
          <span className="search-category">All</span>
          <img
              src={require('../../assets/images/site/icons/filter.png')}
              alt="Filter Icon"
              className="filter-icon"
          />
        </div>
        <div className="divider"></div>
        <input
            type="search"
            className="search-input"
            placeholder="search your next magical read"
            aria-label="Search Bar"
        />
        <img
            src={require('../../assets/images/site/icons/search.png')}
            alt="Search Icon"
            className="search-icon"
        />
      </div>
      <nav className="nav-items">
        <HeaderDropdown/>
        <div className="nav-item language">
          <img
              className="language-icon"
              src={require('../../assets/images/site/icons/lang.png')}
              alt="language"
          />
          <span>EN</span>
        </div>
        <div className="nav-item user nav-pill">
          <div className="login-div">
            <img className="person-icon" src={require('../../assets/images/site/icons/ppl.png')} alt="person"/>
            <span>Hello, <br/>Shantnu</span>
          </div>
          <div className="logout-div">
            <img className="logout-icon" src={require('../../assets/images/site/icons/logout.png')} alt="logout"/>
            <button className="logout-button">Logout</button>
          </div>
        </div>
        <div className="nav-item cart">
          <img
              src={require('../../assets/images/site/icons/cart.png')}
              alt="Shopping Cart"
          />
          <span className="cart-badge">9</span>
          <span className="cart-text">Cart</span>
        </div>
      </nav>
    </div>
  </header>
)
}

export default AppHeader;

