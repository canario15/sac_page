class CategoriesController < ApplicationController


  def show
    @category = Category.find_by_id(params[:id])
  end

  def show_championship
    @category = Category.find_by_id(params[:id])
  end

  def show_gallery
    @category = Category.find_by_id(params[:id])
  end

  def show_pilots
    @category = Category.find_by_id(params[:id])
    @pilots = @category.pilots
  end

  def show_regulation
    @category = Category.find_by_id(params[:id])
  end



  def championship_formula_sac
  end

  def championship_turismo_pista_sac
  end

  def championship_karting_125
  end

  def regulation_formula_sac
  end

  def regulation_turismo_pista_sac
  end

  def regulation_karting_125
  end



end
