require 'rake'

User.all.each do |user|
  user.photo.reprocess! :thumb
end
