class LabelsController < ApplicationController

  before_action :set_blog, only: [:destroy]

  def index
    @labels = Label.all
  end

  def new
    @label = Label.new
  end

  def create
    Label.create(label_params)
    redirect_to labels_path
  end

  def destroy
    @blog.destroy
  end

  private

  def label_params
    params.require(:label).permit(:name)
  end

  def set_blog
  @label = Label.find(params[:id])
  end

end
