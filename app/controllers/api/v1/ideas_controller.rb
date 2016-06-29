class Api::V1::IdeasController < ApplicationController
  respond_to :json

  def index
    respond_with Idea.all
  end

  def create
    respond_with Idea.create(idea_params)
  end

  def update
    idea = Idea.find(params['id'])
    if params[:changeValue] == "increase"
      idea.quality = idea.increase_quality
      idea.save
    end
    if idea.update(idea_params)
      idea.save
      render json: {response: 'successful', quality: idea.quality}
    else
      render json: {response: 'failed'}
    end
  end

  def destroy
    respond_with Idea.destroy(params[:id])
  end

  private

  def idea_params
    params.permit(:title, :body, :quality, :id)
  end
end
