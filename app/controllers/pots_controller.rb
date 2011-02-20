class PotsController < ApplicationController
  def check_pot
    @pot = Pot.find_by_pot_code(params[:pot_code])    
    if @pot
      render :text => {cups_left: @pot.cups_left}    
    else
      render :text => 'POT_NOT_FOUND'
    end
  end
  
  def get_cup
    @pot = Pot.find_by_pot_code(params[:pot_code])
    if @pot
      if @pot.cups_left == 0
        render :text => 'NEEDS_REFILL'
      else
        @pot.cups_left = @pot.cups_left - 1
        @pot.save
        render :text => {cups_left: @pot.cups_left}
      end
    else
      render :text => 'POT_NOT_FOUND'
    end
  end
  
  def refill
    @pot = Pot.find_by_pot_code(params[:pot_code])
    if @pot
      @pot.cups_left = @pot.capacity
      @pot.save
      render :text => 'THANKS'
    else
      render :text => 'POT_NOT_FOUND'
    end
  end
      
end
