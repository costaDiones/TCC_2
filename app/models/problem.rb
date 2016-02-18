class Problem < ActiveRecord::Base
  belongs_to :user, :autosave => true

  validates_presence_of :title, :descripition
end
