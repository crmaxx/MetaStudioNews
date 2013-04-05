class Vote < ActiveRecord::Base
  attr_accessible :news_id, :user_id

  belongs_to :news, :counter_cache => true
  belongs_to :user

  validates_uniqueness_of :news_id, scope: [:user_id]
end
