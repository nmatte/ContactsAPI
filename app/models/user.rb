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

end
