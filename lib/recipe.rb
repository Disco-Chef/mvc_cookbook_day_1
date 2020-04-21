class Recipe
  attr_reader :name, :description, :prep_time
  # When adding prep_time, can edit Recipe's initialize as having an optional parameter
  # def initialize(name, description, prep_time = nil)
  def initialize(name, description, prep_time)         # Recipe.new(HAVE_TO_GIVE_NAME, HAVE_TO_GIVE_DESCRIPTION)
    @name = name
    @description = description
    @prep_time = prep_time
  end
end
