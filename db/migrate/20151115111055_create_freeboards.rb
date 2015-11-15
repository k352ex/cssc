class CreateFreeboards < ActiveRecord::Migration
  def change
    create_table :freeboards do |t|

      t.string :title
      t.string :content
      t.string :author
      # t.string :body

      t.timestamps null: false
    end
  end
end
