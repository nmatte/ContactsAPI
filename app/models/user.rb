class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true

  has_many :contacts,
    class_name: :Contact

  has_many :contact_share,
    class_name: :ContactShare

  has_many :shared_contacts,
    through: :contact_share,
    source: :contact

end
