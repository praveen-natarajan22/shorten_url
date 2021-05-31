class Url < ApplicationRecord
	  before_create :generate_short_url
  def generate_short_url
    rand(36**5).to_s(36)
  end
end
