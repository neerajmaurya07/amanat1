class Mehman < ApplicationRecord
  enum status: [:staying, :returned]
  enum level: [:normal, :safe, :danger]

  before_create :get_level
  before_update :get_level

  def self.search(search)
    if search
      where(['code LIKE ? OR country LIKE ? OR full_name LIKE ? OR passport_no LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      all
    end
  end

  def country_name
    country = self.country
    ISO3166::Country[country]
  end

  def get_level
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
