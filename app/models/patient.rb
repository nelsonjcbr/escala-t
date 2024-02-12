class Patient < ApplicationRecord
  
  has_many :patient_logs, inverse_of: :patient
  
end