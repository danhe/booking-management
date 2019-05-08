class CreateMissions < ActiveRecord::Migration[5.2]
  def change
    create_table :missions do |t|
      t.references :listing, foreign_key: true
      t.string :type
      t.float :price
      t.datetime :mission_date

      t.timestamps
    end
  end
end
