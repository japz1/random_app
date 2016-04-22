class AddColumnsToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :qualitative_scale, :integer
    add_column :patients, :radiologist_name, :string
  end
end
