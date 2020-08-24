class AddIndexMessagesTitle < ActiveRecord::Migration[6.0]
  def change
    add_index :messages, :title
  end
end
