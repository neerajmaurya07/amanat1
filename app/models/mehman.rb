class Mehman < ApplicationRecord
	enum status: [:staying, :returned]
	enum level: [:normal, :safe, :danger]

	def level
      if visa_expiry_date - arrival_date > 120
      	Mehman.safe
      elsif departure_date >= visa_expiry_date   
      	Mehman.safe
      elsif departure_date - visa_expiry_date < -3   
      	Mehman.danger
      else
      	Mehman.normal
    end
end
