class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :country
      t.string :url
      t.timestamps
    end
  end
end
