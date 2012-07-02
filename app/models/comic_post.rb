class ComicPost < ActiveRecord::Base
  attr_accessible :comic
  mount_uploader :comic, ComicUploader
end
