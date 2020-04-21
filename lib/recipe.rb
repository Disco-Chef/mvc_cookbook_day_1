class Recipe
  attr_reader :name, :description, :prep_time
  def initialize(name, description, prep_time)         # Recipe.new(HAVE_TO_GIVE_NAME, HAVE_TO_GIVE_DESCRIPTION)
    @name = name
    @description = description
    @prep_time = prep_time
  end
end
