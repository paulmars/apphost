class App < ActiveRecord::Base
  belongs_to :user
  has_many :builds, -> { order("builds.id DESC") }
  validates :name, presence: true
  validates :identifier, presence: true, uniqueness: { scope: :user_id }
  mount_uploader :icon, IconUploader
  mount_uploader :background, BackgroundUploader
end
