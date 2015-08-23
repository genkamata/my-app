class Article < ActiveRecord::Base
  
  has_attached_file :image,   
      :styles => { large: "1280x768",  medium: "200x200", thumb: "100x100" }, # 画像サイズを指定
      :storage => :s3,
#     :s3_permissions => :pravate, 
      :s3_credentials => "#{Rails.root}/config/s3.yml",
      :path => "#{Rails.root}/images/:id/:styles/:basename.:extension" # S3上の画像保存先パス
     
## Validation
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
end
