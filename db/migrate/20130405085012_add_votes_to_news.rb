class AddVotesToNews < ActiveRecord::Migration
  def change
    add_column :news, :votes_count, :integer
  end
end
