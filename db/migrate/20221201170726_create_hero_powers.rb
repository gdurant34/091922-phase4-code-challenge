class CreateHeroPowers < ActiveRecord::Migration[6.1]
  def change
    create_table :hero_powers do |t|
      t.string :strength
      t.belongs_to :hero
      t.belongs_to :power

      t.timestamps
    end
  end
end
