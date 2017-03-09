require_relative 'todo_view'
require_relative 'todo_model'

class Controller
  attr_accessor :input
  def initialize
    @input = ARGV
    receive_command
  end
	
  def receive_command
    case @input[0]
      when "add"
        add
      when "list"
        list
      when "delete"
        delete
      when "complete"
        complete
      else
        puts "No estas ingresando un comando valido"
    end
  end

  def add
    list = ToDoList.adding(@input[1])
    View.print_list(list)
  end

  def delete
    list = ToDoList.deleting(@input)
    View.print_list(list)
  end

  def complete
    list = ToDoList.completing(@input)
    View.print_list(list)
  end

  def list
    list = ToDoList.enumerate_todo_list
    View.print_list(list)
  end
end

my_list = Controller.new