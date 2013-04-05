class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :news_id

      t.timestamps
    end

    add_index :votes, %w(user_id news_id), :unique => true, :name => 'uniq_one_vote_only'
  end
end
