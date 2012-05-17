class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :title
      t.text :content
      t.integer :author
      t.boolean :admin

      t.timestamps
    end
  end
end
