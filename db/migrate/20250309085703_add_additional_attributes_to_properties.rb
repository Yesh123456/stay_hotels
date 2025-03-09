class AddAdditionalAttributesToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :additional_attributes, :jsonb
  end
end
