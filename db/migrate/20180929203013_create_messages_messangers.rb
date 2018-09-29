class CreateMessagesMessangers < ActiveRecord::Migration[5.2]
  def change
    create_table :messages_messangers, id: false do |t|
      t.belongs_to :message, index: true
      t.belongs_to :messanger, index: true

      t.timestamps
    end
  end
end
