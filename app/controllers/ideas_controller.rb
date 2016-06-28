class IdeasController < ApplicationController
  def index
    ideas = Idea.all
    @ideas= ideas.order(:created_at)
  end

end
