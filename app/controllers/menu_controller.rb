class MenuController < ApplicationController
  def index
      @session = JSON.generate(session)
  end
end
