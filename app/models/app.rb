class App < ActiveRecord::Base

  belongs_to :user
  has_many :builds, -> { order("builds.id DESC") }

  validates :name, presence: true
  validates :identifier, presence: true, uniqueness: { scope: :user_id }
  validates :subdomain, uniqueness: true, allow_nil: true

  mount_uploader :icon, IconUploader
  mount_uploader :background, BackgroundUploader

end
