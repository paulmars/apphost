class Build < ActiveRecord::Base
  mount_uploader :ipa, IpaUploader
end
