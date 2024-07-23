# Two Tables Design Recipe Template

_Copy this recipe template to design and create two related database tables from a specification._

## 1. Extract nouns from the user stories or specification

```
As a user
So I can see all items in my pantry
I want to see a list of foods

As a chef,
To make sure i store my food correctly
I am informed where to store it

As a chef
So I don't waste food
I can see which foods are about to go off

As a chef
So I know how healthy my diet is
I can see the nutritional value of my meals

```

```
Nouns:

Pantry
Food

```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | --------------------|
| Pantry                | Food, Expiry dates, 
|                       | quantity (weight)

| Foods                 | Name, nutritional value,
|                       | Storage instructions, 
|                       |  

1. Name of the first table (always plural): `pantries` 

    Column names: `name`,

2. Name of the second table (always plural): `artists` 

    Column names: `name`, 'starting_date'

## 3. Decide the column types

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: students
id: SERIAL
name: text

Table: cohort
id: SERIAL
name: text
starting_date: date
```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one [TABLE ONE] have many [TABLE TWO]? (Yes/No)
2. Can one [TABLE TWO] have many [TABLE ONE]? (Yes/No)

You'll then be able to say that:

1. **[A] has many [B]**
2. And on the other side, **[B] belongs to [A]**
3. In that case, the foreign key is in the table [B]

Replace the relevant bits in this example with your own:

```
# EXAMPLE

1. Can students belong to multiple cohorts? NO
2. Can cohorts have many students? YES

-> Therefore,
-> A cohort has many students
-> A student belongs to one cohort

-> Therefore, the foreign key is on the students table.
```

*If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).*

## 5. Write the SQL

```sql
-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.

CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY,
  name text,
  starting_date date,
);

-- Then the table with the foreign key second.
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text,
  cohort_id int,
  constraint fk_cohort foreign key(cohort_id)
    references cohorts(id)
-- The foreign key name is always {other_table_singular}_id
);

```

## 6. Create the tables

```bash
psql -h 127.0.0.1 students_db < cohort_table.sql
```