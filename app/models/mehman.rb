class Mehman < ApplicationRecord
  enum status: [:staying, :returned]
  enum level: [:normal, :safe, :danger]

  def self.search(search, id)
    if search
      where(['full_name LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
