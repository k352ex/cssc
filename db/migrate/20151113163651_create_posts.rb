class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.string :title # 제목
      t.string :content # 내용
      t.string :author # 작성자

      t.integer :grade
      t.integer :user_id
      t.integer :post_flag # 0 => 전체공지 , 1 => 자유게시판

      t.timestamps null: false
    end
  end
end
