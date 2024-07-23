-- The job of this file is to reset all of our important database tables.
-- And add any data that is needed for the tests to run.
-- This is so that our tests, and application, are always operating from a fresh
-- database state, and that tests don't interfere with each other.

-- First, we must delete (drop) all our tables
DROP TABLE IF EXISTS pantry_contents;
DROP SEQUENCE IF EXISTS pantry_contents_id_seq;
DROP TABLE IF EXISTS food;
DROP SEQUENCE IF EXISTS food_id_seq;
DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS users_id_seq;


-- Then, we recreate them
CREATE SEQUENCE IF NOT EXISTS users_id_seq;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    password VARCHAR(255)
);

CREATE SEQUENCE IF NOT EXISTS food_id_seq;
CREATE TABLE food (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR,
    grouping VARCHAR,
    cost INTEGER,
    
);

CREATE SEQUENCE IF NOT EXISTS pantry_contents_id_seq;
CREATE TABLE pantry_contents (
    id SERIAL PRIMARY KEY,
    pantry_name VARCHAR,
    food_name INT,
    expiry_date DATE,
    cost DATE,
    FOREIGN KEY (food_name) REFERENCES food(name) ON DELETE CASCADE,
    FOREIGN KEY (cost) REFERENCES food(cost) ON DELETE CASCADE,
);


-- Finally, we add any records that are needed for the tests to run
INSERT INTO users (name, password) VALUES ('charlie_roberts23@hotmail.co.uk', 'Password!23');
INSERT INTO users (name, password) VALUES ('taconlin@hotmail.co.uk', 'Password!24');
INSERT INTO users (name, password) VALUES ('joshuadosanjh@gmail.com', 'Qwerty?09');
INSERT INTO users (name, password) VALUES ('charlieroberts201@hotmail.co.uk', 'passWord?12');

INSERT INTO food (name, description, grouping, cost) VALUES ('broccoli', 'test desc 1', 'group 1', '1');
INSERT INTO food (name, description, grouping, cost) VALUES ('cheddar', 'test desc 2', 'group 2', '2');
INSERT INTO food (name, description, grouping, cost) VALUES ('frozen fish', 'test desc 3', 'group 3', '3');
INSERT INTO food (name, description, grouping, cost) VALUES ('peppers', 'test desc 4', 'group 1', '1');
INSERT INTO food (name, description, grouping, cost) VALUES ('milk', 'test desc 5', 'group 2', '2');
INSERT INTO food (name, description, grouping, cost) VALUES ('ice cream', 'test desc 6', 'group 3', '3');
INSERT INTO food (name, description, grouping, cost) VALUES ('cumin', 'test desc 7', 'group 4', '4');


INSERT INTO pantry_contents (pantry_name, food_name, expiry_date) VALUES ('home 1', 'broccoli', '2024-08-01');
INSERT INTO pantry_contents (pantry_name, food_name, expiry_date) VALUES ('home 1', 'cheddar', '2024-08-02');
INSERT INTO pantry_contents (pantry_name, food_name, expiry_date) VALUES ('home 1', 'ice cream', '2024-10-01');

