class HistoriesController < ApplicationController
  def index
    @blance = Blance.find(params[:blance_id])
    @histories = @blance.histories
  end

  def new
    @blance = Blance.find(params[:blance_id])
    @history = @blance.histories.build
  end

  def edit
    @history = History.find(params[:id])
    @blance = @history.blance
  end

  def create
    @blance = Blance.find(params[:blance_id])
    @history = @blance.histories.build(history_params)
    if @history.save
      redirect_to blance_histories_url(@blance), notice: t(".notice")
    else
      render("new", status: :bad_request)
    end
  end

  def update
    @history = History.find(params[:id])
    @blance = @history.blance
    if @history.update(history_params)
      redirect_to blance_histories_url(@blance), notice: t(".notice")
    else
      render("edit", status: :bad_request)
    end
  end

  def destroy
    @history = History.find(params[:id])
    @blance = @history.blance
    @history.destroy
    redirect_to blance_histories_url(@blance), notice: t(".notice")
  end

  private

  def history_params
    params.require(:history).permit(:game_count, :chance, :investment, :memo)
  end
end
