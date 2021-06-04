class CreateUserFlats < ActiveRecord::Migration[6.0]
  def change
    create_table :user_flats do |t|
      t.references :flat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
