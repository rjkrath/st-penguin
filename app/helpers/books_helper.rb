module BooksHelper

  def missing_stories_apology
    if params[:year].present?
      "There are no stories available from #{params[:year]}."
    end
  end
end
