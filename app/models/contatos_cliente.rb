class ContatosCliente < ActiveRecord::Base
	self.table_name = "contatos_clientes"
	self.primary_key = "id_contato"
end
