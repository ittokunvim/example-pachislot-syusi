class RenameNameToMachineName < ActiveRecord::Migration[7.0]
  def change
    rename_column :blances, :name, :machine_name
  end
end
