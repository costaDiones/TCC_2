class User < ActiveRecord::Base

    enum role: [:normal_user, :admin]

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable




         has_many :hydrometers, :dependent => :delete_all


end
