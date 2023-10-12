# DDL Exercises

The first two exercises are required, as we will be using those databases tomorrow and Friday.
1. HR Database
    - Files are in /Data/SQL/hr_db/
    - Run the create_tables_mssql.sql script to create the tables
    - Run the load_data_mssql.sql script to load data into the tables
    - Run some basic queries to verify the database was created and loaded
2. Retail Database
    - Files are in /Data/SQL/retail_db/
    - Run the create_db_tables_mssql.sql script to create the tables
    - Run the load_db_data_mssql.sql script to load data into the tables
    - Run some basic queries to verify the database was created and loaded
3. Library App
    - The code provided below outlines a simple library catalog application. Use this code to complete the tasks.
    - Tasks
        - Create a Crow's Foot notation ERD for SQL Server
            - You can use the built in SSMS tool or a 3rd party tool
        - Identify the PKs, relationships, and cardinality for each entity
        - Determine any additional columns that should be included for management purposes
            - Hint: Audit changes
        - Create a .sql script that creates all of the tables including relationships and constraints.


```Python
class Author:
    def __init__(self, author_id, name, birthdate):
        self.author_id = author_id
        self.name = name
        self.birthdate = birthdate
        self.books = []

    def add_book(self, book):
        self.books.append(book)

    def get_books(self):
        return self.books

    def __str__(self):
        return f"Author(ID: {self.author_id}, Name: {self.name}, Birthdate: {self.birthdate})"


class Book:
    def __init__(self, book_id, title, publication_date, author):
        self.book_id = book_id
        self.title = title
        self.publication_date = publication_date
        self.author = author

    def set_publisher(self, book_publisher):
        self.publisher = book_publisher

    def get_publisher(self):
        return self.publisher

    def __str__(self):
        return f"Book(ID: {self.book_id}, Title: {self.title}, Publication Date: {self.publication_date}, Author: {self.author.name})"


class Publisher:
    def __init__(self, publisher_id, name, address):
        self.publisher_id = publisher_id
        self.name = name
        self.address = address
        self.books_published = []

    def add_book_published(self, book_publisher):
        self.books_published.append(book_publisher)

    def get_books_published(self):
        return self.books_published

    def __str__(self):
        return f"Publisher(ID: {self.publisher_id}, Name: {self.name}, Address: {self.address})"


class BookPublisher:
    def __init__(self, book, publisher, published_date):
        self.book = book
        self.publisher = publisher
        self.published_date = published_date

    def get_details(self):
        return f"Book '{self.book.title}' published by {self.publisher.name} on {self.published_date}"

    def __str__(self):
        return self.get_details()

```