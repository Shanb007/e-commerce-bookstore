# The Celestial Library - Online Bookstore

A full-stack e-commerce bookstore application built with React and Java Spring Boot, featuring a modern React frontend and a RESTful Java backend with MySQL database.

## Features

### Frontend (React)
- **Modern React with TypeScript** - Built with React 18 and TypeScript for type safety
- **Responsive Design** - Mobile-friendly interface with modern CSS
- **Category-based Navigation** - Browse books by categories (Romance, Fantasy, Mystery, Classics)
- **Search Functionality** - Search books by title, author, or keywords
- **Advanced Filtering** - Filter books by price range, rating, and availability
- **Shopping Cart** - Add/remove books, quantity management with cart drawer
- **Checkout Process** - Complete order flow with customer information
- **Order Confirmation** - Order summary and confirmation page
- **Pagination** - Efficient book listing with pagination support
- **Star Ratings** - Visual rating system for book reviews

### Backend (Java)
- **RESTful API** - Java-based REST API with JAX-RS
- **Database Integration** - MySQL database with JDBC
- **Order Management** - Complete order processing system
- **Customer Management** - Customer registration and management
- **Book Catalog** - Comprehensive book management with categories
- **CORS Support** - Cross-origin resource sharing for frontend-backend communication

## Tech Stack

### Frontend
- **React 18** - Component-based UI library
- **TypeScript** - Type-safe JavaScript
- **React Router** - Client-side routing
- **Axios** - HTTP client for API calls
- **CSS3** - Modern styling with responsive design

### Backend
- **Java 17** - Modern Java with latest features
- **JAX-RS** - RESTful web services
- **Jersey** - JAX-RS implementation
- **Jackson** - JSON processing
- **MySQL** - Relational database
- **JDBC** - Database connectivity
- **Gradle** - Build automation

## Project Structure

```
ShantnuBookstoreReactTransact/
├── client/                 # React frontend
│   ├── src/
│   │   ├── components/     # React components
│   │   ├── contexts/       # React context providers
│   │   ├── assets/         # Images, CSS, and static assets
│   │   └── types.tsx       # TypeScript type definitions
│   ├── public/             # Static assets
│   └── package.json
├── server/                 # Java backend
│   ├── src/main/java/
│   │   ├── api/           # REST API endpoints
│   │   ├── business/      # Business logic layer
│   │   └── com/example/   # Main application
│   ├── src/main/resources/
│   └── build.gradle
└── README.md
```

## Setup and Installation

### Prerequisites
- **Node.js** (v16 or higher)
- **Java JDK** (v17 or higher)
- **MySQL** (v8.0 or higher)
- **Gradle** (v7.0 or higher)

### Database Setup
1. Create a MySQL database for the application
2. Update database connection settings in the server configuration
3. Run the SQL scripts in `server/src/main/resources/` to create tables and seed data

### Backend Setup
1. Navigate to the server directory:
   ```bash
   cd server
   ```

2. Build the project:
   ```bash
   ./gradlew build
   ```

3. Deploy to your application server (Tomcat, etc.)

### Frontend Setup
1. Navigate to the client directory:
   ```bash
   cd client
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the development server:
   ```bash
   npm start
   ```

4. For production build:
   ```bash
   npm run build
   ```

## API Endpoints

### Books
- `GET /api/categories/{categoryId}/books` - Get books by category
- `GET /api/categories/{categoryId}/suggested-books` - Get suggested books
- `GET /api/books/search` - Search books

### Categories
- `GET /api/categories` - Get all categories

### Orders
- `POST /api/orders` - Create new order
- `GET /api/orders/{orderId}` - Get order details

### Customers
- `POST /api/customers` - Create/register customer

## Development

### Running Tests
```bash
# Frontend tests
cd client
npm test

# Backend tests
cd server
./gradlew test
```

### Code Style
- Frontend follows React/TypeScript best practices
- Backend follows Java coding conventions
- ESLint configured for frontend code quality

## Deployment

### Frontend
The React app builds to static files that can be deployed to any web server:
```bash
cd client
npm run build
```

### Backend
The Java application builds to a WAR file for deployment:
```bash
cd server
./gradlew war
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is for educational purposes as part of CS5244 coursework.

## Author

Created by Shantnu for CS5244 - Web Development course.
