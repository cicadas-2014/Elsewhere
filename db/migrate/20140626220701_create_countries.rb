class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :common_name
      t.belongs_to :language
      t.float :political_stability
      t.integer :corruption_index
      t.string :travel_warning
      t.string :two_character_code
      t.string :three_character_code
      t.string :currency
      t.timestamps
    end
  end
end
