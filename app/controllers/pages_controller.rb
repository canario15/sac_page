class PagesController < ApplicationController

	def home
  end

  def news
    @notices = Notice.paginate(:page => params[:page])
  end

  def categories
  end

  def galleries
  end

  def about
  end

  def contact
  end

  def send_contact_info
  end

  def notice
    @notice = Notice.find_by(id: params[:id])
  end

end
