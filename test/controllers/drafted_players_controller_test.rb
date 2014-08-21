require 'test_helper'

class DraftedPlayersControllerTest < ActionController::TestCase
  setup do
    @drafted_player = drafted_players(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drafted_players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drafted_player" do
    assert_difference('DraftedPlayer.count') do
      post :create, drafted_player: { draft_no: @drafted_player.draft_no, player_id: @drafted_player.player_id, team_id: @drafted_player.team_id }
    end

    assert_redirected_to drafted_player_path(assigns(:drafted_player))
  end

  test "should show drafted_player" do
    get :show, id: @drafted_player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @drafted_player
    assert_response :success
  end

  test "should update drafted_player" do
    patch :update, id: @drafted_player, drafted_player: { draft_no: @drafted_player.draft_no, player_id: @drafted_player.player_id, team_id: @drafted_player.team_id }
    assert_redirected_to drafted_player_path(assigns(:drafted_player))
  end

  test "should destroy drafted_player" do
    assert_difference('DraftedPlayer.count', -1) do
      delete :destroy, id: @drafted_player
    end

    assert_redirected_to drafted_players_path
  end
end
