class Project < ActiveRecord::Base
	self.table_name = "projetos"
	self.primary_key = "id_projeto"
	has_many :category
	#belongs_to :category, class_name: "Category", foreign_key: "id_categoria"
	mount_uploader :img, ImageUploader
	mount_uploader :image_packshot, ImageUploader
	mount_uploader :image_selo_iso, ImageUploader	
	mount_uploader :image_outros_selos, ImageUploader	
	mount_uploader :image_referencia, ImageUploader
end
