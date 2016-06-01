class CreateBarbers < ActiveRecord::Migration
  def change
    create_table :barbers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
