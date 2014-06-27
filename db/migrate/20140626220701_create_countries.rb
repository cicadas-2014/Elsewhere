class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.belongs_to :language
      t.timestamps
    end
  end
end
