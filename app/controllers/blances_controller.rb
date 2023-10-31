class BlancesController < ApplicationController
  def index
    @blances = Blance.all
  end

  def show
    @blance = Blance.find(params[:id])
  end

  def new
    @blance = Blance.new
  end

  def edit
    @blance = Blance.find(params[:id])
  end

  def create; end

  def update; end

  def destroy; end
end
