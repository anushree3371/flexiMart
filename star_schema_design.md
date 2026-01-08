Section 1: Schema Overview
Fact Table: fact_sales

Grain:
One row per product per order line item (lowest level of sales detail).

Business Process:
Sales transactions (orders placed by customers).

Measures (Numeric Facts):

quantity_sold: Number of units sold

unit_price: Price per unit at the time of sale

discount_amount: Discount applied to the item

total_amount: Final sales value
(quantity_sold × unit_price − discount_amount)

Foreign Keys:

date_key → dim_date

product_key → dim_product

customer_key → dim_customer

--------------------------------------------------------------------------------

Dimension Table: dim_date

Purpose:
Supports time-based analysis such as daily, monthly, quarterly, and yearly sales trends.

Type:
Conformed dimension (shared across facts if needed).

Attributes:

date_key (PK): Surrogate key (YYYYMMDD)

full_date: Actual calendar date

day_of_week: Monday, Tuesday, etc.

month: 1–12

month_name: January, February, etc.

quarter: Q1, Q2, Q3, Q4

year: 2023, 2024, etc.

is_weekend: Boolean flag

------------------------------------------------------------------------
Dimension Table: dim_product

Purpose:
Enables product-level and category-level analysis.

Attributes:

product_key (PK): Surrogate key

product_id: Business product identifier

product_name

category

brand

price_band (Low / Medium / High)

is_active: Product availability flag

-------------------------------------------------------------------
Dimension Table: dim_customer

Purpose:
Supports customer-centric analysis.

Attributes:

customer_key (PK): Surrogate key

customer_id: Business customer identifier

customer_name

email

city

state

registration_date

customer_segment (New, Returning, Premium)


****************************************************************************************

Section 2: Design Decisions

The granularity of one row per product per order line item was chosen to capture the most detailed level of sales activity. This allows accurate analysis of product performance, discounts, and customer buying behavior without losing transactional detail. Higher-level summaries can always be derived through aggregation.

Surrogate keys were used instead of natural keys to improve performance, ensure consistency, and isolate the data warehouse from changes in source system identifiers. Natural keys such as customer_id or product_id may change or be reused, whereas surrogate keys remain stable and optimized for joins.

This star schema design supports both drill-down and roll-up operations efficiently. Analysts can drill down from yearly sales to quarterly, monthly, and daily levels using the date dimension, or roll up from individual products to categories and brands. The denormalized dimensions and simple joins make analytical queries fast and easy to understand.


*************************************************************************************

Section 3: Sample Data Flow
Source Transaction
Order ID: 101  
Customer: John Doe  
Product: Laptop  
Quantity: 2  
Unit Price: 50,000  
Order Date: 2024-01-15

Data Warehouse Representation

fact_sales

{
  date_key: 20240115,
  product_key: 5,
  customer_key: 12,
  quantity_sold: 2,
  unit_price: 50000,
  discount_amount: 0,
  total_amount: 100000
}


dim_date

{
  date_key: 20240115,
  full_date: '2024-01-15',
  day_of_week: 'Monday',
  month: 1,
  month_name: 'January',
  quarter: 'Q1',
  year: 2024,
  is_weekend: false
}


dim_product

{
  product_key: 5,
  product_name: 'Laptop',
  category: 'Electronics',
  brand: 'HP'
}


dim_customer

{
  customer_key: 12,
  customer_name: 'John Doe',
  city: 'Mumbai',
  customer_segment: 'Returning'
}