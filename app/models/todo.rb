class Todo < ActiveRecord::Base
	validates :Name,:Description,:Price, presence: true,
                    length: { minimum: 3 }
	 has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/pic.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
end
