class PlayersController < ApplicationController
  def index
    @players = Player.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @players }
    end
  end
  
  def new
  end
  
  def create
  end
  
  def show
    @player = Player.find(params[:id])
  end
  
end
