class BooksController < ApplicationController
  def index
    @story = Story.last
  end

  def next
    @story = Story.one_previous(params[:id])
    render json: @story, status: @story.present? ? :ok : :not_acceptable
  end

  def show
    @story = Story.find_by(id: params[:id])
  end

  def archive
    if params[:year].present?
      @stories = Story.where('YEAR(created_at) = ?', params[:year])
    else
      @stories = Story.all.order('created_at desc')
    end
  end
end
