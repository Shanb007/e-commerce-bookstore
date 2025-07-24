import AppHeader from './components/header/AppHeader';
import AppFooter from './components/footer/AppFooter';
import Home from './components/Home'
import CategoryBookList from './components/CategoryBookList';
import '../src/assets/css/global.css'

import {
  BrowserRouter as Router,
  Routes,
  Route,
} from "react-router-dom"


function App() {
  return (
      <div className="body-app">
          <Router basename={"ShantnuBookstoreReact"}>
              <AppHeader />
              <div className="body-container">
                  <Routes>
                      <Route path="/" element={<Home />} />
                      <Route path="/category/:category" element={<CategoryBookList />} />
                      <Route path="*" element={<div>Page Not Found</div>} />
                  </Routes>
              </div>
              <AppFooter />

          </Router>
      </div>
  );
}

export default App;

