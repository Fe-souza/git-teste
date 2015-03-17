class Category < ActiveRecord::Base
	self.table_name = "categorias"
	self.primary_key = "id_categoria"
	has_many :sub_category
	has_many :project
end
