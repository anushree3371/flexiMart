Section A: Limitations of RDBMS

Relational databases like MySQL rely on fixed schemas, which makes them unsuitable for handling highly diverse product attributes. For example, laptops require attributes such as RAM, processor, and storage, while shoes require size, color, and material. In an RDBMS, supporting such variation would require adding many nullable columns or creating separate tables for each product type, increasing complexity and reducing query efficiency.

Frequent schema changes pose another challenge. Adding new product types often requires altering table structures using ALTER TABLE, which is costly, time-consuming, and risky in production environments. Additionally, relational databases are not designed for nested data storage. Customer reviews typically include ratings, comments, timestamps, and user information, which must be split across multiple tables and joined during queries. These joins negatively impact performance and complicate data retrieval, making RDBMS less flexible for evolving e-commerce catalogs.


Section B: NoSQL Benefits

MongoDB overcomes these limitations through its flexible, document-based data model. Each product is stored as a JSON-like document, allowing different products to have different attributes within the same collection. For example, a laptop document can include RAM and processor fields, while a shoe document can include size and color, without modifying the schema.

MongoDB also supports embedded documents, enabling customer reviews to be stored directly within the product document. This structure simplifies data modeling and improves read performance by eliminating complex joins. Furthermore, MongoDB is built for horizontal scalability. Using sharding, data can be distributed across multiple servers, allowing the system to handle large product catalogs and high traffic efficiently. These features make MongoDB well-suited for dynamic, fast-growing platforms like FlexiMart.


Section C: Trade-offs

Despite its advantages, MongoDB has certain drawbacks compared to MySQL. First, MongoDB provides weaker enforcement of data integrity. It does not support foreign key constraints, so maintaining relationships between data entities must be handled at the application level. Second, MongoDB is less efficient for complex transactional operations involving multiple entities. While it supports transactions, they are generally slower and more resource-intensive than traditional relational transactions. These disadvantages mean MongoDB requires careful data modeling and is best suited when flexibility and scalability are prioritized over strict relational consistency.