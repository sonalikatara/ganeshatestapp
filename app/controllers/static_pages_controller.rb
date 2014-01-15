class StaticPagesController < ApplicationController
  def home
   # when visiting static_pages/home.html.erb rails first executes the code in this action and then goes to generate the view corresponding to this action
    if signed_in?
     @micropost = current_user.microposts.build
     @feed_items = current_user.feed.paginate(page: params[:page])
    end
   end

  def help
  end

  def about
  end

  def contact
  end

end
