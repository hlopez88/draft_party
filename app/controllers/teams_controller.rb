class TeamsController < ApplicationController

  def new
  end
  
  def create
    @team = Team.create(team_params)
    
    @team.save
    redirect_to @team
  end
  
  def show
    @team = Team.find(params[:id])
  end
  
  def index
    @teams = Team.all
  end
  

  private
    def team_params
      params.require(:team).permit(:owner, :name)
    end
end
