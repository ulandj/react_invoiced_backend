class Organization < ApplicationRecord
  belongs_to :account
  has_many :contacts

  validates :name, :address, :tax_payer_number, presence: true
end
