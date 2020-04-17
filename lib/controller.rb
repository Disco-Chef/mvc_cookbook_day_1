require_relative 'view.rb'
require_relative 'recipe.rb'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end
  # Always start implementing ONE controller method at a time. Within each of the controller methods 
  #you will write out the steps you want to take and test test test along each step of the way!
  def create
    # 1. use the methods in View 
    name_user_input = @view.ask_user_for_string("name")
    description_user_input = @view.ask_user_for_string("description")
    # 2. Recipe.new( , )
    recipe = Recipe.new(name_user_input, description_user_input)
    # push this task into @recipes array
    @cookbook.add_to_recipes(recipe)
  end

  def list
    recipes = @cookbook.all
    @view.display_recipes(recipes)
  end

  def destroy
    #1. list
    list
    #2. user selects and index
    index = @view.ask_user_for_index
    #3. Use index to delete the right recipe from the @recipe array
    @cookbook.remove_recipe(index)
  end

end


