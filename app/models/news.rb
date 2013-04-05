# == Schema Information
#
# Table name: news
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  body       :text             not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class News < ActiveRecord::Base
  attr_accessible :body, :title, :user_id
  belongs_to :user

  has_many :votes

  validates_presence_of  :body
  validates :title, presence: true, length: { maximum: 150 }

  def voted_on?(user)
    0 < Vote.where(
        :new_id => self.id,
        :user_id => user.id,
    ).count
  end
end
