class Subscription < ActiveRecord::Base
  validates :interest, :zip, :presence => :true
  
  belongs_to :user
  
end
