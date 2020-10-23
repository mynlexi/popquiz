class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end
  
  def run
    puts "Welcome to our Popquiz (You'll get a 0)"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end
  
  def route_action(action)
    case action
    when 1 then @controller.show_next_question
    when 2 then @controller.show
    when 3 then stop
    else puts "try again" 
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts "What do you want to do next?"
    puts "Type '1' - To start"
    puts "Type '2' to see your points"
    puts "Type '3' to exit your programm"
  end
end
    