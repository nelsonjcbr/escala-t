class OrganizationLog < ApplicationRecord
  
  belongs_to :organization, inverse_of: :organization_logs

  scope :do_cnpj, -> (cpnj_aux) { 
    where("contents -> 'organization' -> 'identifier' @> ?", %Q([ { "value":"#{cpnj_aux}", "system":"CNPJ" } ]))
  }

  scope :do_nome, -> (nome_aux) { 
    where("contents -> 'organization' ->> 'name' = ?", nome_aux)
  }
  
end
