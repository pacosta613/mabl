class CreateLeague < ActiveRecord::Migration
  def change
    create_table :league do |t|
      t.string :name

      t.timestamp null: false
    end
  end
end