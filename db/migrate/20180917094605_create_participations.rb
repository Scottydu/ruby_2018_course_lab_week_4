class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.references :movie, foreign_key: true
      t.references :person, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
