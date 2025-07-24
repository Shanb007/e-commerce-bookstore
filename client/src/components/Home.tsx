import React from 'react';
import { Link } from 'react-router-dom';
import '../assets/css/global.css';
import '../assets/css/Home.css';


export const bookList = [
    {
        bookId: 1001,
        title: "Everything Is Tuberculosis",
        author: "John Green",
        price: 2800,
        cover: require('../assets/images/books/EverythingIsTuberculosisCover.png'),
        tagline: "The History and Persistence of Our Deadliest Infection",
        rating: 5.0,
        ratingCount: "243",
        ratingStars: require('../assets/images/site/icons/EITstars.png'),
        ddVector: require('../assets/images/site/icons/dropdown_vector.png'),
        isPublic: true,
    },
    {
        bookId: 1002,
        title: "The 5 Types of Wealth",
        author: "Sahil Bloom",
        price: 2699,
        cover: require('../assets/images/books/typesOfWealth.png'),
        tagline: "A Transformative Guide to Design Your\n Life",
        rating: 4.2,
        ratingCount: "604",
        ratingStars: require('../assets/images/site/icons/typesOfWealthStars.png'),
        ddVector: require('../assets/images/site/icons/dropdown_vector.png'),
        isPublic: true,
    },
    {
        bookId: 1003,
        title: "On Tyranny",
        author: "Timothy Snyder",
        price: 3909,
        cover: require('../assets/images/books/tyranny.png'),
        tagline: "Twenty Lessons from the Twentieth Century",
        rating: 4.6,
        ratingCount: "555",
        ratingStars: require('../assets/images/site/icons/TyrannyStars.png'),
        ddVector: require('../assets/images/site/icons/dropdown_vector.png'),
        isPublic: true,
    },
];

export interface Book {
    bookId: number;
    title: string;
    author: string;
    price: number;
    cover: string;
    tagline: string;
    rating: number;
    ratingCount: string;
    ratingStars: string;
    ddVector: string;
    isPublic: boolean;
}

interface BookItemProps {
    book: Book;
}

function BookItem({ book }: BookItemProps) {
    return (
        <div className="bookItem">
            <div className="bookInfo">
                <img
                    className="bookCover"
                    src={book.cover}
                    alt={`${book.title} Book Cover`}
                />
                <div>
                    <h4 className="bookTitle">{book.title}</h4>
                    <p className="bookAuthor">By {book.author}</p>
                    <p className="bookTagline">
                        {book.tagline.split('\n').map((line, index, arr) => (
                            <React.Fragment key={index}>
                                {line}
                                {index < arr.length - 1 && <br/>}
                            </React.Fragment>
                        ))}
                    </p>
                    <p className="bookPrice">
                        Get it for: <strong>${(book.price / 100).toFixed(2)}</strong>
                    </p>
                    <button className="addToCart">Add to Cart</button>
                </div>
            </div>
            <div className="ratings">
                <p>{book.rating.toFixed(1)}</p>
                <img
                    className="stars"
                    src={book.ratingStars}
                    alt={`${book.title} Rating`}
                />
                <img className="ddVector" src={book.ddVector} alt="Dropdown" />
                <p>{book.ratingCount} ratings</p>
            </div>
        </div>
    );
}

function BookGrid() {
    const publicBooks = bookList.filter(book => book.isPublic);
    return (
        <div className="books-grid-home">
            {publicBooks.map(book => (
                <BookItem key={book.bookId} book={book} />
            ))}
        </div>
    );
}

function Home() {
    return (
        <main>
            <section className="hero">
                <div className="backGroundImage">
                    <img
                        className="celestialLibraryBooks"
                        src={require('../assets/images/site/hero/TheCeletialLibraryBooks.png')}
                        alt="The Celestial Library Books"
                    />
                    <p className="heroImageText">
                        Come Find Your Next Reading Adventure with us.
                    </p>
                    <Link to="/category/Romance" className="cta-button">
                        Shop Now
                    </Link>
                </div>
            </section>
            <h2 className="text-under-hero">
                The #1 Bestsellers That Redefine Their Genre!
            </h2>
            <BookGrid />
        </main>
    );
}

export default Home;
