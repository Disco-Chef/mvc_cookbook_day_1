require 'csv'

class Cookbook
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []       #[<#Recipe0xcsses13129837123987>, <#Recipe1dsxs321321321>, <#Recipex02xss654654>]
    load_csv
  end
  
  def add_to_recipes(recipe)
    @recipes << recipe
    # p recipe      # You can test your code even before using the View file!! Always test whenever -
    # p @recipes                # - possible. If for nothing else, then at least as a sanity check ;)
    save_csv
  end

  def all
    @recipes
  end

  def remove_recipe(index)
    @recipes.delete_at(index - 1)
    save_csv
  end

  def load_csv
    CSV.foreach(@csv_file) do |row|
      recipe = Recipe.new(row[0], row[1], row[2])
      @recipes << recipe
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |row|
      @recipes.each do |recipe|
        row << [recipe.name, recipe.description, recipe.prep_time]
      end
    end
  end
end