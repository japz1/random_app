class AddColumnsChangeCatheterToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :number_punctures, :integer
    add_column :patients, :catheter_exchange, :boolean, default: false
  end
end
