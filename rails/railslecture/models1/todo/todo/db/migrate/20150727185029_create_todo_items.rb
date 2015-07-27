class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :description
      t.boolean :starred
      t.boolean :hidden

      t.timestamps null: false
    end
  end
end
