class Article < ActiveRecord::Base
  has_many :image, :dependent => :destroy
  has_attached_file :image,   
      :styles => { large: "640x400>",  medium:"200x200", thumb: "100x100>" }, # 画像サイズを指定
      :url  => "/assets/arts/:id/:style/:basename.:extension", # 画像保存先のURL先
      :path => "#{Rails.root}/public/assets/arts/:id/:style/:basename.:extension" # サーバ上の画像保存先パス

## Validation
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
