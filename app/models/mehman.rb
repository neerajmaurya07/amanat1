class Mehman < ApplicationRecord
  CATEGORY = %w(arabic english urdu bangle)

  enum status: [:staying, :returned]
  enum level: [:normal, :safe, :danger]

  before_save :set_level

  validates :category, :serial, :passport_no, :full_name, presence: true
  validates_uniqueness_of :serial, scope: :category

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

  def code
    return unless category && serial
    category[0].upcase + serial.to_s
  end

  private

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
