class View
  def ask_user_for_string(attribute)
    puts "#{attribute}?"
    print "> "
    gets.chomp
  end

  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} - #{recipe.description} - Prep Time: #{recipe.prep_time}"
    end
  end

  def ask_user_for_index
    puts "Which item number?"
    print "> "
    gets.chomp.to_i
  end
end

