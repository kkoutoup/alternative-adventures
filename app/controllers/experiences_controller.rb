class ExperiencesController < ApplicationController
  before_action :find_experience, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:p]
      @experiences = Experience.where(user_id:params[:p].to_i)
    else
      @experiences = Experience.all
    end
  end

  def show; end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(strong_params)
    @experience.user = current_user
    if @experience.save
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  def edit; end

  def update
    @experience.update(strong_params)
    if @experience.save
      redirect_to experience_path(@experience)
    else
      render :edit
    end
  end

  def destroy
    @experience.destroy
    redirect_to experiences_path
  end

  private

  def strong_params
    params.require(:experience).permit(:title, :experience_type, :description, :price)
  end

  def find_experience
    @experience = Experience.find(params[:id])
  end
end
