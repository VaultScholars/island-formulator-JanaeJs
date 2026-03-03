class BatchesController < ApplicationController
  before_action :require_authentication
  
  def index
    @batches = Current.user.batches.includes(:recipe).order(made_on: :desc)
  end

  def show
    @batch = Current.user.batches.find(params[:id])
  end

  def new
    @batch = Current.user.batches.build(
      recipe_id: params[:recipe_id],
      made_on: Date.today
    )
  end

  def create
    @batch = Current.user.batches.build(batch_params)

    if @batch.save
      redirect_to batches_path, notice: "Batch was successfully logged."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @batch = Current.user.batches.find(params[:id])
    @batch.destroy
    redirect_to batches_path, notice: "Batch was successfully deleted."
  end

  private

  def batch_params
    params.require(:batch).permit(:recipe_id, :made_on, :notes)
  end
end