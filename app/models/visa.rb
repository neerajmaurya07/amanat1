class Visa < ApplicationRecord
  belongs_to :mehman

  enum status: [:normal, :applied, :confirmed]
end
