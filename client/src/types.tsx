// Contains all the custom types we want to use for our application
import Classics from './assets/images/categories/classics.jpg';
import Fantasy from './assets/images/categories/fantasy.jpg';
import Mystery from './assets/images/categories/mystery.jpg';
import Romance from './assets/images/categories/romance.jpg';
export interface BookItem {
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
  hasReadNow: boolean;
}

export interface CategoryItem {
  categoryId: number;
  name: string;
}
export const categoryImages: Record<string, any> = {
  classics: Classics,
  //sciencefiction : ScienceFiction,
  //historicalfiction : HistoricalFiction,
  romance : Romance,
  //bestseller: BestSeller,
};
export const categoryList = [
  { categoryId: 1001, name: "Thriller" , link: "/category/Romance", active: false },
  { categoryId: 1002, name: "Science Fiction", link: "/category/Romance" , active: false },
  { categoryId: 1003, name: "Best Seller", link: "/category/Romance" , active: false },
  { categoryId: 1004, name: "Romance", link: "/category/Romance", active: true },
  { categoryId: 1004, name: "Historical Fiction", link: "/category/Romance", active: false  },
];

export const bookList = [
  {
    bookId: 2001,
    title: "It Ends with us : A Novel",
    author: "Colleen Hoover",
    price: 1199,
    cover: require('../src/assets/images/books/ewus.png'),
    tagline: "Love, trauma, resilience, \nHope.",
    rating: 4.3,
    ratingCount: "2.5k",
    ratingStars: require('../src/assets/images/site/icons/ewusStars.png'),
    ddVector: require('../src/assets/images/site/icons/dropdown_vector.png'),
    isPublic: true,
    hasReadNow: false,
  },
  {
    bookId: 2002,
    title: "Enchanted to Meet You",
    author: "Meg Cabot",
    price: 1766,
    cover: require('../src/assets/images/books/etmy.png'),
    tagline: "A Witches of West Harbor \nNovel",
    rating: 4.9,
    ratingCount: "1.2k",
    ratingStars: require('../src/assets/images/site/icons/typesOfWealthStars.png'),
    ddVector: require('../src/assets/images/site/icons/dropdown_vector.png'),
    isPublic: true,
    hasReadNow: false,
  },
  {
    bookId: 2003,
    title: "The Christmas Countdown",
    author: "Holly Cassidy",
    price: 1767,
    cover: require('../src/assets/images/books/christmasCountdown.png'),
    tagline: "She's given up on love and \nChristmas… but fate hasn't",
    rating: 4.7,
    ratingCount: "433",
    ratingStars: require('../src/assets/images/site/icons/tccStars.png'),
    ddVector: require('../src/assets/images/site/icons/dropdown_vector.png'),
    isPublic: true,
    hasReadNow: true,
  },
  {
    bookId: 2004,
    title: "Book Lovers",
    author: "Emily Henry",
    price: 1581,
    cover: require('../src/assets/images/books/bookLovers.png'),
    tagline: "One summer. Two rivals\n A Twist.",
    rating: 5.0,
    ratingCount: "243",
    ratingStars: require('../src/assets/images/site/icons/EITstars.png'),
    ddVector: require('../src/assets/images/site/icons/dropdown_vector.png'),
    isPublic: true,
    hasReadNow: false,
  },
  {
    bookId: 2005,
    title: "Kiss Me at Christmas",
    author: "Jenny Bayliss",
    price: 1399,
    cover: require('../src/assets/images/books/kissMeChristmas.png'),
    tagline: "White Christmas meets\nNora Ephron.",
    rating: 4.8,
    ratingCount: "999",
    ratingStars: require('../src/assets/images/site/icons/kissChristmasStars.png'),
    ddVector: require('../src/assets/images/site/icons/dropdown_vector.png'),
    isPublic: true,
    hasReadNow: true,
  },
  {
    bookId: 2006,
    title: "Is She Really Going Out with\n him",
    author: "Sophie Cousens",
    price: 3909,
    cover: require('../src/assets/images/books/isSheReallyGOWhim.png'),
    tagline: "A hilarious love story.",
    rating: 4.4,
    ratingCount: "784",
    ratingStars: require('../src/assets/images/site/icons/sheReallyWithHimStars.png'),
    ddVector: require('../src/assets/images/site/icons/dropdown_vector.png'),
    isPublic: true,
    hasReadNow: false,
  },
];
