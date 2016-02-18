class Called < ActiveRecord::Base
  belongs_to :user, :autosave => true
  validates_presence_of :affair, :datescheduling, :typecalled, :description

end
