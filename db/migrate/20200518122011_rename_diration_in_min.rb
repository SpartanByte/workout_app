class RenameDirationInMin < ActiveRecord::Migration[6.0]
  def change
    rename_column :exercises, :diration_in_min, :duration_in_min
  end
end
