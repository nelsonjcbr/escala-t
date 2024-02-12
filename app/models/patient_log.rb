class PatientLog < ApplicationRecord
  
  belongs_to :patient, inverse_of: :patient_logs
  belongs_to :organization, inverse_of: :patient_logs

  scope :do_cpf, -> (cpf_aux) { where(cpf: cpf_aux)}

  scope :do_nome, -> (nome_aux) { 
    where("contents -> 'patient' -> 'name' @> ?", %Q([ { "text":"#{nome_aux}" } ])) 
  }
  
  
  
  #contents -> 'patient' -> 'identifier' @> '[{"system":"CPF", "value":"79423911111"}]';
  #select id, cpf, contents -> 'patient' -> 'name' from patient_logs where contents -> 'patient' -> 'name' @> '[{"text":"Ana da Silva Pinto"}]';
  

  ######################
  # select id, contents -> 'patient' -> 'identifier' 
  # from patient_logs where exists 
  # (select id from patient_logs s_pl, jsonb_array_elements(contents -> 'patient') with ordinality arr(item_object, position) where s_pl.id = patient_logs.id and
  #  arr.item_object -> 'identifier' ->> 'system' = 'CNS' and arr.item_object -> 'identifier' ->> 'value' = '700454568883914934' limit 1);
  #####################
  # select id, cpf, contents -> 'patient' -> 'name' from patient_logs where exists 
  # (select id from patient_logs s_pl, jsonb_array_elements(contents -> 'patient' -> 'name') with ordinality arr(item_object, position) 
  #   where s_pl.id = patient_logs.id and arr.item_object ->> 'text' ilike '%Ana%' limit 1);


end
