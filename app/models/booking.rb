class Booking < ApplicationRecord
  after_create :generate_missions

  belongs_to :listing

  private

  def generate_missions
    GenerateMissionsService.new(self).call
  end
end
