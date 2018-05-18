class HomeController < ApplicationController

  def index
    #may not work because home page is not in a folder
    render 'home'
  end
end
