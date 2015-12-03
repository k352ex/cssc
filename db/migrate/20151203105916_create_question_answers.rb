class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|

      t.string :title
      t.string :author
      t.text :contents

      t.integer :user_id

      t.timestamps null: false
    end
  end
end
