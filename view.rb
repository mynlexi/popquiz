class View
  def display_question(item)
      puts "#{item.question}: a#{item.answer1}, b#{item.answer2}, c#{item.answer3}, d#{item.answer4}"
  end

  def say(item)
    puts item
  end

  def get(item)
    puts "#{item}?"
    gets.chomp.downcase
  end
end