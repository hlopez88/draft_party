class DraftedPlayersController < ApplicationController
  before_action :set_drafted_player, only: [:show, :edit, :update, :destroy]

  # GET /drafted_players
  # GET /drafted_players.json
  def index
    @drafted_players = DraftedPlayer.all
      
      respond_to do |format|
        format.html  # index.html.erb
        format.json  { render :json => @drafted_players }
      end
  end

  # GET /drafted_players/1
  # GET /drafted_players/1.json
  def show
  end

  # GET /drafted_players/new
  def new
    @drafted_player = DraftedPlayer.new
    
      respond_to do |format|
        format.html  # new.html.erb
        format.json  { render :json => @drafted_player }
      end  
  end

  # GET /drafted_players/1/edit
  def edit
  end

  # POST /drafted_players
  # POST /drafted_players.json
  def create
    @drafted_player = DraftedPlayer.new(drafted_player_params)

    respond_to do |format|
      if @drafted_player.save
        format.html { redirect_to @drafted_player, notice: 'Drafted player was successfully created.' }
        format.json { render action: 'show', status: :created, location: @drafted_player }
      else
        format.html { render action: 'new' }
        format.json { render json: @drafted_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drafted_players/1
  # PATCH/PUT /drafted_players/1.json
  def update
    respond_to do |format|
      if @drafted_player.update(drafted_player_params)
        format.html { redirect_to @drafted_player, notice: 'Drafted player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @drafted_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drafted_players/1
  # DELETE /drafted_players/1.json
  def destroy
    
    @drafted_player.destroy
    respond_to do |format|
      format.html { redirect_to drafted_players_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drafted_player
      @drafted_player = DraftedPlayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drafted_player_params
      params.require(:drafted_player).permit(:player_id, :team_id, :draft_no)
    end
end
