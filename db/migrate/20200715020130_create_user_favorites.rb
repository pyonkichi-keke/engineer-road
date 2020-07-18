class CreateUserFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :user_favorites do |t|
      t.timestamps
      t.references :user, foreign_key: true
      t.references :favorite, foreign_key: true     
    end
  end
end
