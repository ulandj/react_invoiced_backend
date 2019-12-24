class Organization < ApplicationRecord
  belongs_to :account
  has_many :contacts
end
