class Search < ApplicationRecord
  def search_mehmen
  	mehmen = Mehman.all

  	mehmen = mehmen.where(['status LIKE ?', "%#{status}%"]) if status.present?
  	mehmen = mehmen.where(['level LIKE ?', "%#{level}%"]) if level.present?
  	mehmen = mehmen.where(['code LIKE ? OR full_name LIKE ? OR passport_no LIKE ?' , "%#{keywords}%", "%#{keywords}%", "%#{keywords}%"]) if keywords.present?
  	mehmen = mehmen.where(['arrival_date > ?', "%#{arrival_date_from}%"]) if arrival_date_from.present?
  	mehmen = mehmen.where(['arrival_date < ?', "%#{arrival_date_to}%"]) if arrival_date_to.present?
  	mehmen = mehmen.where(['visa_expiry_date > ?', "%#{visa_expiry_date_from}%"]) if visa_expiry_date_from.present?
  	mehmen = mehmen.where(['visa_expiry_date > ?', "%#{visa_expiry_date_to}%"]) if visa_expiry_date_to.present?

  	return mehmen
  end
end
