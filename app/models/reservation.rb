class Reservation < ApplicationRecord
  after_create :generate_missions

  belongs_to :listing

  private

  def generate_missions
    GenerateMissionsService.new(nil, self).call
  end
end
