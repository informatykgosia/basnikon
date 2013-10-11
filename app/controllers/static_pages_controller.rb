class StaticPagesController < ApplicationController
  def home
    render :layout => "special"
  end
  def about
    render :layout => "about"
  end
end
