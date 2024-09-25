class MicropostController < ApplicationController
  before_action :find_micropost, only: %i[show edit update destroy]

  def index
    @microposts = Micropost.all
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(micropost_params)
    if @micropost.save
      redirect_to micropost_path(@micropost), notice: 'Micropost was successfully created.'
    else
      render :new, alert: 'There was a problem creating the micropost.'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @micropost.update(micropost_params)
      redirect_to @micropost, notice: 'Micropost was successfully updated.'
    else
      render :edit, alert: 'There was a problem updating the micropost.'
    end
  end

  def destroy
    if @micropost
      @micropost.destroy
      redirect_to '/micropost', notice: 'Micropost was successfully deleted.'
    else
      redirect_to '/micropost', alert: 'Micropost not found.'
    end
  end

  private

  def find_micropost
    @micropost = Micropost.find(params[:id])
  end

  def micropost_params
    params.require(:micropost).permit(:content, :user_id)
  end
end
