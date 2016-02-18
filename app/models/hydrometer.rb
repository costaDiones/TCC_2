class Hydrometer < ActiveRecord::Base
  belongs_to :user
  has_many :readings

end
