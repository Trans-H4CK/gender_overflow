class AddYoutubeUrl < ActiveRecord::Migration
  def change
    add_column :answers, :youtube_id, :string
  end
end
