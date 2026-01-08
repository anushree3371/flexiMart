/*
MongoDB Operations for FlexiMart
Database: fleximart
Collection: products
*/

// -----------------------------
// OPERATION 1: LOAD DATA
// -----------------------------
// Command to import JSON file into MongoDB:
// Run this in terminal / MongoDB shell
/*
mongoimport --db fleximart --collection products --file products_catalog.json --jsonArray
*/

// -----------------------------
// OPERATION 2: BASIC QUERY
// -----------------------------
// Find all Electronics products with price < 50000
// Return only name, price, and stock

db.products.find(
  {
    category: "Electronics",
    price: { $lt: 50000 }
  },
  {
    _id: 0,
    name: 1,
    price: 1,
    stock: 1
  }
);

// -----------------------------
// OPERATION 3:
// -----------------------------
// Find products with average rating >= 4.0

db.products.aggregate([
  { $unwind: "$reviews" },
  {
    $group: {
      _id: "$name",
      avg_rating: { $avg: "$reviews.rating" }
    }
  },
  {
    $match: {
      avg_rating: { $gte: 4.0 }
    }
  }
]);

// -----------------------------
// OPERATION 4: UPDATE OPERATION
// -----------------------------
// Add a new review to product ELEC001

db.products.updateOne(
  { product_id: "ELEC001" },
  {
    $push: {
      reviews: {
        user: "U999",
        rating: 4,
        comment: "Good value",
        date: new Date()
      }
    }
  }
);

// -----------------------------
// OPERATION 5: COMPLEX AGGREGATION
// -----------------------------
// Calculate average price by category
// Return category, avg_price, product_count
// Sort by avg_price descending

db.products.aggregate([
  {
    $group: {
      _id: "$category",
      avg_price: { $avg: "$price" },
      product_count: { $sum: 1 }
    }
  },
  {
    $project: {
      _id: 0,
      category: "$_id",
      avg_price: 1,
      product_count: 1
    }
  },
  {
    $sort: { avg_price: -1 }
  }
]);
