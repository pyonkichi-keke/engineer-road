class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.timestamps
      t.text :content
      t.text :image
      t.text :title
      t.references :group, foreign_key: true 
      t.references :user, foreign_key: true 
    end
  end
end