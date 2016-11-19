class Mehman < ApplicationRecord
  TYPE = [%w(A Arabic), %w(E English), %w(U Urdu), %w(B Bangle)]

  enum status: [:staying, :returned]
  enum level: [:normal, :safe, :danger]

  attr_accessor :type, :serial

  before_save :set_level, :set_code

  def self.search(search)
    if search
      where('code LIKE ? OR country LIKE ? OR full_name LIKE ? OR passport_no LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end

  def country_name
    ISO3166::Country[country]
  end

  private

  def set_code
    return unless type && serial
    self.code = type + serial.to_s
  end

  def set_level
    if visa_expiry_date - arrival_date > 119
      self.level = :safe
    elsif departure_date == nil
      self.level = :normal
    elsif visa_expiry_date >= departure_date
      self.level = :safe
    elsif visa_expiry_date < departure_date
      self.level = :danger
    else
      self.level = :normal
    end
  end
end
