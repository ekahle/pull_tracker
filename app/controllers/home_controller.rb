class HomeController < ApplicationController
  def index
    @pulls=Pull.all
  end
end
