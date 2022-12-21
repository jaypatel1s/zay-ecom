class HomeController < ApplicationController
  before_action :initialize_session
  before_action :increment_visit_count


  def index
    @shoes = Shoe.all
    @category = Category.all
  end

  def about
  end

  def blog
  end

  def contacts
  end
  
  private

  def initialize_session
    session[:visit_count] ||= 0 #on first visit initialize
  end

  def increment_visit_count
    session[:visit_count] += 1  
    @visit_count = session[:visit_count]
  end

end
