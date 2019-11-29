class Waiter
  attr_reader :name, :yrs_experience
  @@all = []
  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    self.class.all << self
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select { |m| m.waiter == self }
  end

  # def customers
  #   self.meals.collect { |m| m.customer }
  # end

  def best_tipper
    best_tipped_meal = self.meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end

    best_tipped_meal.customer
  end

  def worst_tipper
    worst_tipped_meal = self.meals.min do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end

    worst_tipped_meal.customer
  end

  def self.all
    @@all
  end

end