require 'carrierwave/processing/mime_types'
require 'ipa_reader'

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

  process :ipa

  def ipa
    file = IpaReader::IpaFile.new(current_path)
    app = model.user.apps.where(identifier: file.bundle_identifier).first_or_create({
      name: file.plist["CFBundleName"],
      user: model.user
    })
    model.app = app
  end

end
