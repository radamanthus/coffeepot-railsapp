class Pot < ActiveRecord::Base
  def get_cup
    self.cups_left = self.cups_left - 1
    self.save
    return self.cups_left
  end
  
  def refill
    self.cups_left = self.capacity
    self.save
    return self.capacity
  end
end
