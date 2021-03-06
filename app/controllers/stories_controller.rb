class StoriesController < ScriptoriumController

  before_action :find_story, except: [:index, :new, :create]

  def index
    @stories = Story.order('created_at desc')
  end

  def new
    @story = Story.new
    render :show
  end

  def create
    @story = Story.new(story_params)

    if @story.save
      flash[:notice] = "'#{@story.title}' was created."
      redirect_to stories_path
    else
      flash.now[:error] = @story.errors.full_messages
      render :show
    end
  end

  def edit
  end

  def update
    if @story.update_attributes(story_params)
      flash[:notice] = "'#{@story.title}' was updated."
      redirect_to stories_path
    else
      flash.now[:error] = @story.errors.full_messages
      render :edit
    end
  end

  def show
  end

  def delete
  end

  private

  def find_story
    @story = Story.find_by(id: params[:id])

    unless @story
      flash[:warning] = "Can't find requested story with id: #{params[:id]}"
      redirect_to stories_path
    end
  end

  def story_params
    params.require(:story).permit(:title, :narrative)
  end
end
