class Story < ActiveRecord::Base

  validates :title, :narrative, presence: true
  validates :title, uniqueness: true

  def self.one_previous(current_id)
    where('id < ?', current_id).last
  end

end
