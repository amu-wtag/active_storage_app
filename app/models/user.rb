class User < ApplicationRecord
  has_one_attached :pic
  has_one_attached :document
  has_many_attached :videos
  has_secure_password

  def pic_resize(x, y)
    x = x.to_i
    y = y.to_i
    # puts "\n\n ***Converted x: #{x}, Converted y: #{y}" # Debugging line

    pic.variant(resize_to_limit: [x, y])
  end
end
