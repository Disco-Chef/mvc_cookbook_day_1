require_relative 'view.rb'
require_relative 'recipe.rb'
require 'nokogiri'
require 'open-uri'

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
    prep_time_user_input = @view.ask_user_for_string('Prep time')
    # 2. Recipe.new( , )
    recipe = Recipe.new(name_user_input, description_user_input, prep_time_user_input)
    # push this task into @recipes array
    @cookbook.add_to_recipes(recipe)
  end

  def list
    recipes = @cookbook.all
    @view.display_recipes(recipes)
  end

  def import
    # 1. Ask user for a keyword (get it from a view method, store it here)
    keyword = @view.ask_user_for_string("Ingredient")
    # 2. Scrape BBCGoodFood (call a scraping method, passing
    #   it the keyword as an argument) Should return array of Recipe Objects. Store it.
    scraping_results = scraping(keyword)
    # 3. Display results (use a view method and pass it the results that you got from scraping) (results = [<#Recipe32423>, <#Recipe531354>])
    @view.display_recipes(scraping_results)
    # 4. Ask for the recipe to import (view method asking user for index, store it)
    user_index_choice = @view.ask_user_for_index
    # 5. Add to cookbook (cookbook method adding a recipe from the results array) (pass it the index from above)
    recipe_selected = scraping_results[user_index_choice - 1]
    @cookbook.add_to_recipes(recipe_selected)
    # 6. Display (optional: re-display your Recipes (not the scraping results!))
    list
  end

  def destroy
    #1. list
    list
    #2. user selects and index
    index = @view.ask_user_for_index
    #3. Use index to delete the right recipe from the @recipe array
    @cookbook.remove_recipe(index)
  end

  def scraping(word)
    search_results = []
    url = "https://www.bbcgoodfood.com/search/recipes?query=#{word}"

    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    # We search for the first 5 cards and on each of those we search for the information we want.
    # Otherwise, you will need 3 searches (if you include prep-time) and spend your time matching
    # elements of three arrays with eachother. Do-able, but not convenient.
    html_doc.search('.node-teaser-item').first(5).each do |card|
      name = card.search('.teaser-item__title a').text.strip
      description = card.search('.field-item').text.strip
      prep_time = card.search('.teaser-item__info-item--total-time').text.strip
      # We build our Recipe object immediately after finding the information for it.
      recipe = Recipe.new(name, description, prep_time)
      search_results << recipe
    end
    # We return the search_results, which is an array of Recipe Objects, to pass it to the View.
    return search_results
  end
end


# DOM classes from bbcgoodfood:
# card: ".node-teaser-item"
#       title: '.teaser-item__title a'
#       description: '.field-item'
#       prep_time: '.teaser-item__info-item--total-time'