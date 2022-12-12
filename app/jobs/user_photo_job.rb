class UserPhotoJob < ApplicationJob
  def perform(id, file_path)
    user = User.find(id)
    public_id = "profile-picture-#{user.id}"
    Cloudinary::Uploader.upload(
      file_path,
      public_id:,
      overwrite: true, invalidate: true
    )
    user.update(picture: public_id)
    puts "User #{id} photo job completed: #{public_id}"
  end
end
