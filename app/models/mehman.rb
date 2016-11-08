class Mehman < ApplicationRecord
  enum status: [:staying, :returned]
  enum level: [:normal, :safe, :danger]

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
end
