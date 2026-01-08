

## Entity-Relationship Description

### ENTITY: customers
**Purpose:** Stores customer information.  
**Attributes:**
- customer_id: Unique identifier for each customer (Primary Key).
- first_name: Customer's first name.
- last_name: Customer's last name.
- email: Customer’s email address (nullable if missing).
- phone: Standardized phone number in format +91-XXXXXXXXXX.
- city: City where the customer resides.
- registration_date: Date the customer registered (YYYY-MM-DD).
- customer_sk: Surrogate key (auto-increment).

**Relationships:**
- One customer can place **MANY** orders (1:M with `sales` table).

---

### ENTITY: products
**Purpose:** Stores product catalog information.  
**Attributes:**
- product_id: Unique identifier for each product (Primary Key).
- product_name: Name of the product.
- category: Standardized category (e.g., Electronics, Fashion, Groceries).
- price: Product price (defaults to 0.0 if missing).
- stock_quantity: Available stock (defaults to 0 if missing).
- product_sk: Surrogate key (auto-increment).

**Relationships:**
- One product can appear in **MANY** sales transactions (1:M with sales table).

---

### ENTITY: sales
**Purpose:** Stores transactional sales data.  
**Attributes:**
- 'transaction_id': Unique identifier for each transaction (Primary Key).
- 'customer_id': Foreign Key referencing customers.customer_id.
- product_id: Foreign Key referencing products.product_id.
- quantity: Number of units sold.
- unit_price: Price per unit at time of sale.
- transaction_date: Date of transaction (YYYY-MM-DD).
- status: Transaction status (Completed, Pending, Cancelled).
- sale_sk: Surrogate key (auto-increment).

**Relationships:**
- Each sale links **ONE customer** to **ONE product**.
- Many sales can belong to one customer (M:1).
- Many sales can involve one product (M:1).

---

### ENTITY: orders (logical extension of sales)
**Purpose:** Represents the logical grouping of transactions into orders.  
**Attributes:**
- order_id: Unique identifier (Primary Key).
- customer_id: Foreign Key referencing customers.customer_id.
- order_date: Date the order was placed.
- total_amount: Aggregated monetary value of the order.

**Relationships:**
- One order can contain **MANY** sales line items (1:M with sales).

---

## Normalization Explanation

This schema is designed in **Third Normal Form (3NF)**.  
- **Functional Dependencies:**  
  - customer_id → first_name, last_name, email, phone, city, registration_date 
  - product_id → product_name, category, price, stock_quantity  
  - transaction_id → customer_id, product_id, quantity, unit_price, transaction_date, status  
- Each non-key attribute depends only on the primary key of its entity. For example, in customers, the city depends only on customer_id and not on other non-key attributes.  
- **Avoiding Anomalies:**  
  - **Update anomaly:** Customer details are stored once in customers, so updating a phone number does not require changes in multiple rows.  
  - **Insert anomaly:** New customers can be added without requiring a sale record, since customers is independent. Similarly, new products can be inserted without sales.  
  - **Delete anomaly:** Deleting a sale does not remove customer or product information, since they are stored separately.  
- **3NF Justification:**  
  - The schema eliminates transitive dependencies. For example, product category is stored in products and not repeated in sales.  
  - Each table has a single theme: customers, products, sales, or orders.  
  - This ensures data integrity, reduces redundancy, and supports efficient queries.  

Overall, the design is normalized to 3NF, ensuring consistency and minimizing anomalies while maintaining flexibility for future extensions.

---

## Sample Data Representation

### customers
| customer_id | first_name | last_name | email                     | phone         | city      | registration_date |
|-------------|------------|-----------|---------------------------|---------------|-----------|-------------------|
| C001        | Rahul      | Sharma    | rahul.sharma@gmail.com    | +91-9876543210| Bangalore | 2023-01-15        |
| C002        | Priya      | Patel     | priya.patel@yahoo.com     | +91-9988776655| Mumbai    | 2023-02-20        |

### products
| product_id | product_name        | category    | price   | stock_quantity |
|------------|---------------------|-------------|---------|----------------|
| P001       | Samsung Galaxy S21  | Electronics | 45999.0 | 150            |
| P002       | Nike Running Shoes  | Fashion     | 3499.0  | 80             |

### sales
| transaction_id | customer_id | product_id | quantity | unit_price | transaction_date | status     |
|----------------|-------------|------------|----------|------------|------------------|------------|
| T001           | C001        | P001       | 1        | 45999.0    | 2024-01-15       | Completed  |
| T002           | C002        | P004       | 2        | 2999.0     | 2024-01-16       | Completed  |

### orders
| order_id | customer_id | order_date | total_amount |
|----------|-------------|------------|--------------|
| O001     | C001        | 2024-01-15 | 45999.0      |
| O002     | C002        | 2024-01-16 | 5998.0       |

---