class Organization < ApplicationRecord
  
  belongs_to :user, inverse_of: :organization
  has_many :organization_logs, inverse_of: :organization
  has_many :patient_logs, inverse_of: :organization
  
end
