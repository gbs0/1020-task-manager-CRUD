echo "CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
description TEXT,
done INTEGER DEFAULT(0));" | sqlite3 task.db