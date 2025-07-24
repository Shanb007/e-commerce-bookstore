import React from 'react';
import '../assets/css/CategoryBookList.css';
import CategoryNav from './CategoryNav';
import { bookList, Book } from '../types';



interface CategoryBookListItemProps {
    book: Book;
}

function CategoryBookListItem({ book }: CategoryBookListItemProps) {
    return (
        <div className="bookItem">
            <div className="bookInfo">
                {book.hasReadNow ? (
                    <div className="bookImageWrapper">
                        <img className="bookCover" src={book.cover} alt={book.title} />
                        <button className="readNow">Read Now</button>
                    </div>
                ) : (
                    <img className="bookCover" src={book.cover} alt={book.title} />
                )}
                <div>
                    <h4 className="bookTitle">
                        {book.title.split('\n').map((line, index, arr) => (
                        <React.Fragment key={index}>
                            {line}
                            {index < arr.length - 1 && <br/>}
                        </React.Fragment>
                    ))}</h4>
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
                <p>{typeof book.rating === 'number' ? book.rating.toFixed(1) : book.rating}</p>
                <img className="stars" src={book.ratingStars} alt={`${book.title} Rating`} />
                <img className="ddVector" src={book.ddVector} alt="Dropdown" />
                <p>{book.ratingCount} ratings</p>
            </div>
        </div>
    );
}

function CategoryBookList() {
    const publicBooks = bookList.filter((book) => book.isPublic);
    return (
        <>
            <CategoryNav />
            <div className="books-grid-category">
                {publicBooks.map((book) => (
                    <CategoryBookListItem key={book.bookId} book={book} />
                ))}
            </div>
        </>
    );
}

export default CategoryBookList;
