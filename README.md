please click this link for [domain model and user stories](https://docs.google.com/document/d/1wJbKZYCtzAtQvjJMoB2z82jam7BUpG7y-oK7oyS0v3Q/edit)

## To set up the database: ##

Connect to psql
Create the database using the psql command CREATE DATABASE bookmark_manager;
Connect to the database using the pqsl command \c bookmark_manager;
Run the query we have saved in the file 01_create_bookmarks_table.sql

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the Bookmark Manager app:

```
rackup -p 9292
```
