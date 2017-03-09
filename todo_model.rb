require 'csv'

class ToDo
  attr_accessor :text, :complete
  def initialize(text, state)
    @text = text
    @complete = state
  end 
end

class ToDoList

	def self.adding(input)
    todo = create_todo(input)
    write_todo(todo)
    enumerate_todo_list
  end

  def self.deleting(input)
    reading_todo_file
    @todo_list.delete_at(todo_number(input))
    save_todo_list
    enumerate_todo_list
  end

  def self.completing(input)
    reading_todo_file
    indice = todo_number(input)
    @todo_list[indice][1] = "true"
    save_todo_list
    enumerate_todo_list
  end

  def self.reading_todo_file
    @todo_list = CSV.read("todos.csv"){}
  end
  def self.create_todo(input, state = "false")
    task = ToDo.new(input, state)
  end

  def self.write_todo(task)
    #guardar como arreglo
    row = "#{task.text},#{task.complete}\n"
    File.open('todos.csv', 'a+') {|file| file << row}
  end

  def self.enumerate_todo_list
    @todo_list = []
    id = 0
    CSV.foreach("todos.csv") do |row|
      @todo_list << row.unshift(id+=1)
    end
    @todo_list
  end

  def self.save_todo_list
    File.open('todos.csv', 'w') {|file| file}
    @todo_list.each do |task|
      todo = create_todo(task[0], task[1])
      write_todo(todo)
    end
  end

  def self.todo_number(input)
    input[1].to_i-1
  end
  
end

