  class Patient < ActiveRecord::Base
  @@num_rms = 2
  @@num_tacs = 2
  
  validates :name, :age, :identification, :modality, presence: true
  validate :validate_quantity, on: :create
  before_create :set_random_algorithm, on: :create

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |result|
        csv << result.attributes.values_at(*column_names)
      end
    end
  end

  private

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
          break if Patient.where(modality: "RM", catheter_exchange: false).count >= (@@num_rms*4)      
        end

      else 

        loop do
          random = rand(0..3)
          if Patient.where(modality: "TAC", catheter_exchange: false, catheter: array_tac[random][:type_catheter], caliber: array_tac[random][:type_caliber]).count < @@num_tacs
            self.catheter = array_tac[random][:type_catheter]
            self.caliber = array_tac[random][:type_caliber]
            break
          end
          break if Patient.where(modality: "TAC", catheter_exchange: false).count >= (@@num_tacs*4) 
        end
      end 
    end

    def validate_quantity
      if modality == "RM"
        errors.add(:modality, "El número de pacientes de RM está completo") if Patient.where(modality: "RM", catheter_exchange: false).count >= (@@num_rms*4)
      else
        errors.add(:modality, "El número de pacientes de TAC está completo") if Patient.where(modality: "TAC", catheter_exchange: false).count >= (@@num_tacs*4)
      end
    end
  
end
