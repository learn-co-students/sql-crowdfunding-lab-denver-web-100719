CREATE TABLE projects(
    id INTEGER PRIMARY KEY,
    category TEXT,
    title TEXT,
    funding_goal TEXT,
    start_date TEXT,
    end_date TEXT
);

CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER
);

CREATE TABLE pledges(
    id INTEGER PRIMARY KEY,
    amount INTEGER,
    user_id INTEGER,
    project_id INTEGER
);