class Patient < ActiveRecord::Base

  validates :name, :age, :identification, :modality, presence: true
  before_save :set_random_algorithm

  def set_random_algorithm
    array_rm = [{type_catheter: "NG", type_caliber: 20}, {type_catheter: "NG", type_caliber: 22},
                {type_catheter: "CC", type_caliber: 20}, {type_catheter: "CC", type_caliber: 22}]

    array_tac = [{type_catheter: "NG", type_caliber: 20}, {type_catheter: "NG", type_caliber: 22},
                 {type_catheter: "CC", type_caliber: 18}, {type_catheter: "CC", type_caliber: 20}]

    if modality == "RM"

      loop do
        random = rand(0..3)
        if Patient.where(modality: "RM", catheter: array_rm[random][:type_catheter], caliber: array_rm[random][:type_caliber]).count < 25
          self.catheter = array_rm[random][:type_catheter]
          self.caliber = array_rm[random][:type_caliber]
          break
        end        
      end

    else 

      loop do
        random = rand(0..3)
        if Patient.where(modality: "TAC", catheter: array_tac[random][:type_catheter], caliber: array_tac[random][:type_caliber]).count < 175
          self.catheter = array_tac[random][:type_catheter]
          self.caliber = array_tac[random][:type_caliber]
          break
        end
      end
    end 
  end

  
end
