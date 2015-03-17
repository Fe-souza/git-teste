class ImagesProject < ActiveRecord::Base
	self.table_name = "imagens_projeto"
	self.primary_key = "id_imagem"
	mount_uploader :img, ImageUploader
end
