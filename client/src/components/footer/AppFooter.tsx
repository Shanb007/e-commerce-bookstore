import '../../assets/css/AppFooter.css'
import '../../assets/css/global.css'
import {Link} from "react-router-dom";


function AppFooter(){
return(
    <footer className="container">
        <div className="footer-columns">
            <div className="footer-column footer-directions">
                <h2>Directions</h2>
                <div className="footer-address-row">
                    <a href="https://maps.app.goo.gl/niJrbcxEcxUcTP2C8" target="_blank">
                        <img src={require('../../assets/images/site/icons/pin.png')} alt="Pin icon" className="social-icon footer-pin-icon"/>
                    </a>
                    <p className="footer-address-text">3625 Potomac Avenue, Alexandria, VA, 22305</p>
                </div>
            </div>
            <div className="footer-column footer-extra">
                <h2>Get to Know Us</h2>
                <a href="#">Careers</a><br/>
                <a href="#">Newsletters</a>
            </div>
            <div className="footer-column footer-extra">
                <h2>Let Us Help You</h2>
                <a href="#">Your Account</a><br/>
                <a href="#">Your Orders</a>
            </div>
            <div className="footer-column-contact">
                <div className="footer-contact-info">
                    <h2>Contact Us</h2>
                    <div className="footer-contact-row">
                        <a href="https://www.gmail.com" target="_blank">
                            <img src={require('../../assets/images/site/icons/mail.png')} alt="mail icon" className="social-icon"/>
                        </a>
                        <p className="footer-contact-text">clibrarymagic@gmail.com</p>
                    </div>
                    <div className="footer-contact-row">
                        <a href="https://www.googlemaps.com" target="_blank">
                            <img src={require('../../assets/images/site/icons/phone.png')} alt="Phone icon" className="social-icon"/>
                        </a>
                        <p className="footer-contact-text">+1-123-456-3456</p>
                    </div>
                </div>
                <div className="socials">
                    <div className="footer-social-row">
                        <a href="https://www.facebook.com" target="_blank">
                            <img src={require('../../assets/images/site/icons/fb.png')} alt="Facebook icon" className="social-icon"/>
                        </a>
                        <a href="https://www.facebook.com" target="_blank">
                            <p className="social-text">Facebook</p>
                        </a>
                    </div>
                    <div className="footer-social-row">
                        <a href="https://www.Twitter.com" target="_blank">
                            <img src={require('../../assets/images/site/icons/x.png')} alt="Twitter icon" className="social-icon"/>
                        </a>
                        <a href="https://www.Twitter.com" target="_blank">
                            <p className="social-text">X</p>
                        </a>
                    </div>
                    <div className="footer-social-row">
                        <a href="https://www.Instagram.com" target="_blank">
                            <img src={require('../../assets/images/site/icons/insta.png')} alt="Instagram icon" className="social-icon"/>
                        </a>
                        <a href="https://www.Instagram.com" target="_blank">
                            <p className="social-text">Instagram</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div className="footer-bottom">
            <p className="footer-bottom-text">
                © 2024 Celestial Library Pvt Ltd. All rights reserved |
                <a href="privacy.html" className="footer-link">Privacy Notice</a> |
                <a href="terms.html" className="footer-link">Term of Use</a>
            </p>
        </div>
    </footer>
)
}

export default AppFooter;
