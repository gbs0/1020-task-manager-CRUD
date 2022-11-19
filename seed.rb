require 'sqlite3'

DB = SQLite3::Database.new('task.db')

DB.execute("INSERT INTO tasks VALUES name = ?, description = ?", "Terminar Livecode", "Finalizar o livecode do sabado.")
DB.execute("INSERT INTO tasks (name, description) VALUES (?, ?)", "Recolher Roupa", "Tirar a roupa do Varal.")
DB.execute("INSERT INTO tasks (name, description) VALUES (?, ?)", "Aproveitar Black-Friday", "Gastar mais do que eu posso comprar.")