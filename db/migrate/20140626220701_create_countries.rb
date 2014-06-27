class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.belongs_to :language
      t.float :political_stability
      t.integer :corruption_index
      t.string :travel_warning
      t.timestamps
    end
  end
end
