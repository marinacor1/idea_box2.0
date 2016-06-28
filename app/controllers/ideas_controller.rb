class IdeasController < Api::ApiController
  def index
    ideas = Idea.all
    @ideas= ideas.order(:created_at)
  end

end
