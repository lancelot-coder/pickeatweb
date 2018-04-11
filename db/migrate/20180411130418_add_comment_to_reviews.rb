class AddCommentToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :comment, :string
    add_column :reviews, :rating, :integer
  end
end
