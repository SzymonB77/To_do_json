class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :note
      t.boolean :is_done, default: false
     
      t.timestamps
    end
  end
end
