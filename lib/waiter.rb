class Waiter
    @@all = []

    def initialize(name, experience)
        @name= name
        @experience = experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip = 0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select  {|meal| meal.waiter == self}
    end

    def waiters
        Meal.map { |map| meal.customer}
    end

    def best_tipper
        biggest_tip = meals.max {|meal_a, meal_b| meal_a.tip <=> meal_b.tip}
        biggest_tip.customer
    end
end