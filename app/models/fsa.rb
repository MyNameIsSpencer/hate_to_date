class Fsa < ApplicationRecord
  has_many :users

  geocoded_by :fsa_to_latitude_longitude
  after_validation :geocode

  def fsa_to_latitude_longitude
    return self.name
  end

end
