require 'faker'

class Url < ActiveRecord::Base

  before_create :createShortURL

  def createShortURL
    self.short_url = "http://localhost:9393/" << Faker::Base.regexify("[A-Za-z0-9]{5}")
    self.click_count = 0
  end
end