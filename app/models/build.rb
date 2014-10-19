require 'digest'

module DigestGenerator
  ##
  # Create a hash based on the file content at +file_path+
  # I hope it is not too slow
  #
  # === Params
  # +file_path+: the path for file, assumed exists
  # +digest_klass+: Optional, the digest class your want to use
  #
  # === Returns
  #
  # digest from file content
  def self.digest_for_file_at(file_path, digest_klass=Digest::SHA1)
    digest = digest_klass.new

    digest.file(file_path).hexdigest
  end
end

class Build < ActiveRecord::Base

  # validates :ipa_digest, uniqueness: true

  belongs_to :user

  mount_uploader :ipa, IpaUploader

  def ipa_digest
    # Check if LOCAL file exists, i.e. is uploading file
    # 1. File not changed = just read from record
    # 2. File not present = How to generate digest?
    # 3. File has no path = Same as #2
    # 4. File is not local = The file is uploaded, not uploading, this check does not work if file are uploaded locally though
    if ipa_changed? &&
        ipa.file.present? &&
        ipa.file.respond_to?(:path) &&
        File.exists?(ipa.file.path)
      DigestGenerator.digest_for_file_at(ipa.file.path)
    else # Reading image
      self[:ipa_digest]
    end
  end

  before_save :update_ipa_digest

protected

  def update_ipa_digest
    self.ipa_digest = ipa_digest if ipa_changed?
  end

end
