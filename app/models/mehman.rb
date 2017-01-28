class Mehman < ApplicationRecord
  CATEGORY = %w(arabic english urdu bangle)

  belongs_to :user

  enum status: [:staying, :returned]
  enum level: [:normal, :safe, :danger]

  before_save :set_level

  validates :code, length: { in: 2..8 }, presence: true 
  validates :passport_no, :full_name, :country, :arrival_date, :visa_expiry_date, presence: true
  validates_uniqueness_of :code, case_sensitive: false
  validates_uniqueness_of :passport_no, case_sensitive: false

  def country_name
    ISO3166::Country[country]
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
