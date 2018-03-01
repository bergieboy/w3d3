# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :short_urls,
    class_name: :ShortenedUrl,
    primary_key: :id,
    foreign_key: :user_id
end
