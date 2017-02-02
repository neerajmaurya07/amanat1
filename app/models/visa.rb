class Visa < ApplicationRecord
  belongs_to :mehman

  enum status: [:applied, :confirmed]
end
