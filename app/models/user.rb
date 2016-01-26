# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true

  has_many :contacts,
    class_name: :Contact,
    dependent: :destroy

  has_many :contact_share,
    class_name: :ContactShare,
    dependent: :destroy

  has_many :shared_contacts,
    through: :contact_share,
    source: :contact

  has_many :comments, as: :voiceable

  has_many :authored_comments,
    class_name: :Contact,
    foreign_key: :author_id,
    primary_key: :id

  has_many :groups

  has_many :groupings,
    through: :groups,
    source: :groupings

  has_many :grouped_contacts,
    through: :groupings,
    source: :contacts

  def get_favorites
    contact_share.where(is_favorite:true) + contacts.where(is_favorite:true)
  end

end
