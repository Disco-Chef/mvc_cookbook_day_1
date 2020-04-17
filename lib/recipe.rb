class Recipe
  attr_reader :name, :description
  def initialize(name, description)         # Recipe.new(HAVE_TO_GIVE_NAME, HAVE_TO_GIVE_DESCRIPTION)
    @name = name
    @description = description
  end
end
