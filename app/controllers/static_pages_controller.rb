class StaticPagesController < ApplicationController
  def home
   # when visiting static_pages/home.html.erb rails first executes the code in this action and then goes to generate the view corresponding to this action

  end

  def help
  end

  def about
  end

  def contact
  end

end
