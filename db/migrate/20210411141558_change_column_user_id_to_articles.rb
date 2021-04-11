class ChangeColumnUserIdToArticles < ActiveRecord::Migration[6.0]
  def change
    change_column_null :articles, :user_id, true
  end
end
