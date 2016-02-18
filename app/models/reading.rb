class Reading < ActiveRecord::Base
  belongs_to :hydrometer
  belongs_to :prince
    validates_presence_of :month_reference, :prince_id

end
