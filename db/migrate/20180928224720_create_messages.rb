class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :sender, null: false
      t.string :addressee, null: false
      t.text :body, null: false
      t.boolean :sent, default: false
      t.datetime :send_on

      t.timestamps
    end
  end
end
