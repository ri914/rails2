class Reservation < ApplicationRecord
  belongs_to :room

  validate :checkin_before_checkout

  def duration
    (checkout - checkin).to_i
  end

  def total_price
    duration * people * room.fee
  end
  
  private

  def checkin_before_checkout
    return if checkin.blank? || checkout.blank?

    if checkin > checkout
      errors.add(:checkin)
    end
  end
end
