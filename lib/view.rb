class View
  def ask_user_for_string(attribute)
    puts "What is the #{attribute} of the recipe?"
    print "> "
    gets.chomp
  end

  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_user_for_index
    puts "Which item number do you want to delete?"
    print "> "
    gets.chomp.to_i
  end
end

