class UserAdmin < ActiveRecord::Base
	self.table_name = "usuarios_admin"
	self.primary_key = "user_id_admin"
end
