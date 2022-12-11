class HomeController < ApplicationController
  def index
    @shoes = Shoe.all
    @category = Category.all
    session[:visit_count] ||= 0  #on first visit initialize
    session[:visit_count] += 1  
    @visit_count = session[:visit_count]

  end

  def about
  end

  def blog
  end

  def contacts
  end
end
