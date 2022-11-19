require 'pry'
class Task
  attr_reader :id
  attr_accessor :name, :description, :done

  def initialize(attr = {})
    @id = attr[:id]
    @name = attr[:name]
    @description = attr[:description]
    @done = attr[:done]
  end

  def mark_as_done!
    @done = 1
    self.save
  end

  def save
    if @id
      DB.execute("UPDATE tasks SET name = ?, description = ?, done = ? WHERE id = ?", @name, @description, @done, @id)
    else 
      DB.execute("INSERT INTO tasks (name, description) VALUES (?, ?)", @name, @description)
    end
  end

  def self.all
    DB.results_as_hash = true
    query = "SELECT * FROM tasks"
    results = DB.execute(query)
    results.map do |task|
      Task.new(id: task["id"], name: task["name"], description: task["description"], done: task["done"])
    end
  end
  
  def self.find(id)
    DB.results_as_hash = true
    result = DB.execute("SELECT * FROM tasks WHERE id = ?", id).first
    Task.new(id: result["id"], name: result["name"], description: result["description"], done: result["done"])
    # Retorna uma instancia de Task.new
  end

  def self.destroy(id)
    DB.execute("DELETE FROM tasks WHERE id = ?", id)
  end

  def self.display
    results = Task.all
    results.each do |task|
        # 1. [ ] Finalizar Livecode 
        # 1. [X] Finalizar Livecode 
        done = task.done.zero? ? "[ ]" : "[X]"
        puts "#{task.id}. #{done} #{task.name} - #{task.description}"
    end
    puts "\n"
  end

  def self.create(name, description)
    task = Task.new(name: name, description: description)
    # Salvar o registro no DB
    task.save
  end
end