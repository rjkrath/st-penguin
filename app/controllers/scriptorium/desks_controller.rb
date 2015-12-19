class Scriptorium::DesksController < ApplicationController
  layout :scriptorium

  before_action :authenticate_author!

  def show
  end
end
