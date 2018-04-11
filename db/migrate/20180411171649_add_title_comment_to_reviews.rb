class AddTitleCommentToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :comment_title, :string
  end
end
