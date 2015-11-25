class CreateFreeboardComments < ActiveRecord::Migration
  def change
    create_table :freeboard_comments do |t|
      t.text :content
      t.belongs_to :board, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
