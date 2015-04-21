class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :imageUrl, :latitude, :longitude, :name
end
