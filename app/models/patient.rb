  class Patient < ActiveRecord::Base
  @@num_rms = 2
  @@num_tacs = 2
  
  validates :name, :age, :identification, :modality, presence: true
  before_create :set_random_algorithm
  validate :validate_quantity

  def set_random_algorithm
    array_rm = [{type_catheter: "Nueva Generación", type_caliber: 20}, {type_catheter: "Nueva Generación", type_caliber: 22},
                {type_catheter: "Catéter convencional", type_caliber: 20}, {type_catheter: "Catéter convencional", type_caliber: 22}]

    array_tac = [{type_catheter: "Nueva Generación", type_caliber: 20}, {type_catheter: "Nueva Generación", type_caliber: 22},
                 {type_catheter: "Catéter convencional", type_caliber: 18}, {type_catheter: "Catéter convencional", type_caliber: 20}]

    if modality == "RM"

      loop do
        random = rand(0..3)
        if Patient.where(modality: "RM", catheter_exchange: false, catheter: array_rm[random][:type_catheter], caliber: array_rm[random][:type_caliber]).count < @@num_rms
          self.catheter = array_rm[random][:type_catheter]
          self.caliber = array_rm[random][:type_caliber]
          break
        end        
      end

    else 

      loop do
        random = rand(0..3)
        if Patient.where(modality: "TAC", catheter_exchange: false, catheter: array_tac[random][:type_catheter], caliber: array_tac[random][:type_caliber]).count < @@num_tacs
          self.catheter = array_tac[random][:type_catheter]
          self.caliber = array_tac[random][:type_caliber]
          break
        end
      end
    end 
  end

  def validate_quantity
    if modality == "RM"
      errors.add(:modality, "El número de pacientes de RM está completo") if Patient.where(modality: "RM").count >= (@@num_rms*4)
    else
      errors.add(:modality, "El número de pacientes de TAC está completo") if Patient.where(modality: "TAC").count >= (@@num_tacs*4)
    end
  end

  
end
