# patterns used: Strategy, Decoration

class Person
#  include Decorator
  attr_accessor :stomach_capacity, :avg_intake_per_meal
  
  def initialize(capacity, intake)
    @stomach_capacity = capacity
    @avg_intake_per_meal = intake
  end
  
  def eat_strategy ( strategy  )
      # TODO: first use only one(remove old, use new one), secondly, use decorator 
      
      self.class.send :include, strategy
      self.send :eat 
      # EXP. multiple module inclusion, name conflict exists?
      return self
  end
  
  
  
end


#module Decorator
#   def initialize(strategy)
#     self.class.send :include, strategy
#   end
#
#   def method_missing(method, *args)
#     args.empty? ? @decorated.send(method) : @decorated.send(method, args)
#   end
#end
 
module TryEatLess
  
  STAY_HUNGRY_COEFFICIENT = 0.5
  def eat
     @stomach_capacity = @stomach_capacity - (@avg_intake_per_meal * STAY_HUNGRY_COEFFICIENT )
     puts "#{@stomach_capacity} yuan equally food can be eaten."
     return self
  end
end
 
module TryEatNormal
  
  def eat
     @stomach_capacity -= @avg_intake_per_meal
     puts "#{@stomach_capacity} yuan equally food can be eaten."
     return self
  end
end

module TryEatMore
  
  EXTRA_INTAKE_COEFFICIENT = 1.5
  def eat
     @stomach_capacity -= @avg_intake_per_meal * EXTRA_INTAKE_COEFFICIENT
     puts "#{@stomach_capacity} yuan equally food can be eaten."
     return self
  end
end
 

 
# create scenarios for experimenting? 


 
 
 
num_of_people_per_table = 10
# data  collected from dianping.com,  for the simplicity of calculation,  
# market value is used instead of calories or whatever.
food_allocation_per_person = 100   

food_per_table = food_allocation_per_person * num_of_people_per_table 
 
 
 
a = Person.new(500, 150)
a.eat_strategy(TryEatLess).eat_strategy(TryEatLess)
 
#b = Person.new(500, 400, TryEatLessStrategy)
#b.eat
 


