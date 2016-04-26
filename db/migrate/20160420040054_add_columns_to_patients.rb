class AddColumnsToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :qualitative_scale, :string
  end
end
