class AddVariablesToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :sex, :string
    add_column :patients, :oncological, :boolean
    add_column :patients, :cardiovascular, :boolean
    add_column :patients, :recent_intravenous_treatment, :boolean
    add_column :patients, :injection_speed, :decimal, precision: 15, scale: 2
    add_column :patients, :change_speed_injection, :boolean
    add_column :patients, :injury, :boolean
    add_column :patients, :injury_type, :string
    add_column :patients, :fhlebitis, :boolean
    add_column :patients, :fhlebitis_type, :string
    add_column :patients, :puncture, :boolean
    add_column :patients, :blood_exposure, :boolean
    add_column :patients, :blood_exposure_type, :string
    add_column :patients, :insertion_pain, :integer
    add_column :patients, :administration_pain, :integer
    add_column :patients, :type_procedure, :string
    add_column :patients, :rupture, :boolean
    add_column :patients, :complete_record, :boolean

  end
end
