require 'carrierwave/processing/mime_types'

class IpaUploader < CarrierWave::Uploader::Base

  include CarrierWave::MimeTypes

  storage :fog

  def store_dir
    "builds"
  end

  def filename
    "#{model.ipa_digest}.ipa"
  end

end
