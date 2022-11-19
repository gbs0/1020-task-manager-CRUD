require_relative 'task'
require 'sqlite3'

DB = SQLite3::Database.new('task.db')

puts "----- Welcome to Task Manager -----"

@running = true

def run
  print_actions
  user_choice = gets.chomp.to_i
  dispatch(user_choice)
end

def ask_for(string)
  puts "What's the #{string} of the task?"
  gets.chomp
end

def dispatch(user_choice)
  case user_choice
  when 1
    Task.display
  when 2
    # Criar a task com name e description
    name = ask_for("name")
    description = ask_for("description")
    # Criar um objeto do tipo task
    Task.create(name, description)
  when 3
    Task.display
    id = ask_for("id").to_i
    task = Task.find(id)
    task.mark_as_done!
  when 4
    Task.display
    id = ask_for("id").to_i
    Task.destroy(id)
  when 5
    puts "Bye bye!"
    @running = false
  else
    puts "Invalid Option!"
  end
end
def print_actions
  puts "1. List all Tasks"
  puts "2. Create a New Task"
  puts "3. Mark Task as Done!"
  puts "4. Delete a Task"
  puts "5. Exit"
end

while @running
  run
end

