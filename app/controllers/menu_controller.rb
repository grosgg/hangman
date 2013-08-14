class MenuController < ApplicationController
  def index
      puts JSON.generate(session)
  end
end
