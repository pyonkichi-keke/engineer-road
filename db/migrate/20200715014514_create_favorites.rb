class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.timestamps
      t.references :user, foreign_key: true
      t.references :message, foreign_key: true
    end
  end
end
