class PotsController < ApplicationController
  def check_pot
    @pot = Pot.find_by_pot_code(params[:pot_code])    
    if @pot
      render :text => {cups_left: @pot.cups_left}.to_json
    else
      render :text => 'POT_NOT_FOUND'.to_json
    end
  end
  
  def get_cup
    @pot = Pot.find_by_pot_code(params[:pot_code])
    if @pot
      if @pot.get_cup <= 0
        render :text => 'NEEDS_REFILL'.to_json
      else
        render :text => {cups_left: @pot.cups_left}.to_json
      end
    else
      render :text => 'POT_NOT_FOUND'.to_json
    end
  end
  
  def refill
    @pot = Pot.find_by_pot_code(params[:pot_code])
    if @pot
      @pot.refill
      render :text => {cups_left: @pot.cups_left}.to_json
    else
      render :text => 'POT_NOT_FOUND'.to_json
    end
  end
      
end
