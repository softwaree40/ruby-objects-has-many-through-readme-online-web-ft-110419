class Customer
   attr_reader :name, :age
  @@all = []
  def initialize(name, age)
    @name = name
    @age = age
    self.class.all << self
  end

  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select { |m| m.customer == self }
  end

  def waiters
    self.meals.collect { |m| m.waiter }
  end

  def self.all
    @@all
  end
  
end