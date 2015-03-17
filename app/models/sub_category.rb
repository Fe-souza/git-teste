class SubCategory < ActiveRecord::Base
		self.table_name = "sub_categorias"
		self.primary_key = "id_sub_categoria"

		belongs_to :category
end
