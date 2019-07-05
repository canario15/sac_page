class CircuitsController < ApplicationController

  before_action :set_hover

  def index
    if params[:category_id] == "1" || params[:category_id] == "3"
      @category = Category.find(params[:category_id])
      @circuits = Category.find(1).circuits
    else
      @category = Category.find(params[:category_id])
      @circuits = @category.circuits
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @circuit = Circuit.find(params[:id])
  end

   def set_hover
    @hover_menu = CONSTANT_MENU_CATEGORIY_ID
  end

end