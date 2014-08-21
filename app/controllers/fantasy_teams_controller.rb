class FantasyTeamsController < ApplicationController
  before_action :set_fantasy_team, only: [:show, :edit, :update, :destroy]

  # GET /fantasy_teams
  # GET /fantasy_teams.json
  def index
    @fantasy_teams = FantasyTeam.all
      respond_to do |format|
        format.html  # new.html.erb
        format.json  { render :json => @fantasy_teams }
      end  
  end

  # GET /fantasy_teams/1
  # GET /fantasy_teams/1.json
  def show
  end

  # GET /fantasy_teams/new
  def new
    @fantasy_team = FantasyTeam.new
      respond_to do |format|
        format.html  # new.html.erb
        format.json  { render :json => @fantasy_team }
      end  
  end

  # GET /fantasy_teams/1/edit
  def edit
  end

  # POST /fantasy_teams
  # POST /fantasy_teams.json
  def create
    @fantasy_team = FantasyTeam.new(fantasy_team_params)

    respond_to do |format|
      if @fantasy_team.save
        format.html { redirect_to @fantasy_team, notice: 'Fantasy team was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fantasy_team }
      else
        format.html { render action: 'new' }
        format.json { render json: @fantasy_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fantasy_teams/1
  # PATCH/PUT /fantasy_teams/1.json
  def update
    respond_to do |format|
      if @fantasy_team.update(fantasy_team_params)
        format.html { redirect_to @fantasy_team, notice: 'Fantasy team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fantasy_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fantasy_teams/1
  # DELETE /fantasy_teams/1.json
  def destroy
    @fantasy_team.destroy
    respond_to do |format|
      format.html { redirect_to fantasy_teams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fantasy_team
      @fantasy_team = FantasyTeam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fantasy_team_params
      params.require(:fantasy_team).permit(:team_name, :draft_position)
    end
end
