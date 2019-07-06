class Api::V1::BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = @api_user.boards.new(board_params)

    if @board.save
      render json: {
        success: 'Board was successfully created.',
        board: @board
      }
    else
      render json: { errors: @board.errors }
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    if @board.update(board_params)
      render json: {
        success: 'Board was successfully updated.',
        board: @board
      }
    else
      render json: { errors: @board.errors }
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = @api_user.boards.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:title)
    end
end
