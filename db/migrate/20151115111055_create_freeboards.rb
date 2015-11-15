class CreateFreeboards < ActiveRecord::Migration
  def change
    create_table :freeboards do |t|

      t.string :title
      t.string :context
      t.string :author

      t.timestamps null: false
    end
  end
end
