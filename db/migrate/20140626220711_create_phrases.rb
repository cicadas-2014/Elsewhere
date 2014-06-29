class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.belongs_to :country
      t.string :hello
      t.string :please
      t.string :thanks
      t.string :bathroom
      t.timestamps
    end
  end
end
