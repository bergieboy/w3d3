# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  short_url  :string
#  long_url   :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord

  belongs_to :user,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  def self.random_code
    until ShortenedUrl.short_url
      code = SecureRandom.base64(12)
      ShortenedUrl.short_url = code unless ShortenedUrl.exists?(code)
    end

    ShortenedUrl.short_url
  end


end
