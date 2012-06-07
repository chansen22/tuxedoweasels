class ComicPost < ActiveRecord::Base
  mount_uploader :comic, ComicUploader
end
