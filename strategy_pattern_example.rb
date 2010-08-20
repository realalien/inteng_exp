class Person.new(500, 100, TryEatLessAtLunchStrategy)
  def initialize(strategy)
    self.class.send :include, strategy
  end
end
 
module StrategyA
  def execute
     puts 'Doing the task the normal way'
  end
end
 
module StrategyB
  def execute
     puts 'Doing the task alternatively'
  end
end
 
module StrategyC
  def execute
     puts 'Doing the task even more alternatively'
  end
end
 
a = Context.new(StrategyA)
a.execute #=> Doing the task the normal way
 
b = Context.new(StrategyB)
b.execute #=> Doing the task alternatively
 
c = Context.new(StrategyC)
c.execute #=> Doing the task even more alternatively

