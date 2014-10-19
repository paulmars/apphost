require 'carrierwave/processing/mime_types'

class IpaUploader < CarrierWave::Uploader::Base

  include CarrierWave::MimeTypes

  storage :fog

  def store_dir
    "builds/#{model.id}"
  end

  def filename
    # "#{model.id}.ipa"
    "#{model.ipa_digest}.ipa"
  end

end
