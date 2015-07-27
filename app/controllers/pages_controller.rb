class PagesController < ApplicationController

	def home
    @hover_menu = CONSTANT_MENU_HOME_ID
    @last_news = Notice.last(3)

  end

  def news
    @hover_menu = CONSTANT_MENU_NEWS_ID
    @notices = Notice.paginate(:page => params[:page])
  end

  def categories
    @hover_menu = CONSTANT_MENU_CATEGORIY_ID
    @categories = Category.all
  end

  def galleries
    @hover_menu = CONSTANT_MENU_GALERY_ID
  end

  def about
    @hover_menu = CONSTANT_MENU_ABOUT_ID
  end

  def contact
    @hover_menu = CONSTANT_MENU_CONTACT_ID
  end

  def send_contact_info
  end

  def notice
    @notice = Notice.find_by(id: params[:id])
  end

end
