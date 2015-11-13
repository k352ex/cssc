class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.string :title # 제목
      t.string :content # 내용
      t.string :author # 작성자
       
      t.timestamps null: false
    end
  end
end
