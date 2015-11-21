class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|

      t.string :title # 제목
      t.string :content # 내용
      t.string :author # 작성자

      t.integer :grade
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
