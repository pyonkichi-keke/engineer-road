class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.timestamps
      t.string :title, null: false
      t.string :content, null: false
      t.string :image
      t.references :group, foreign_key: true 
      t.references :user, foreign_key: true 
    end
  end
end
