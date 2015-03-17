class HistoricalProject < ActiveRecord::Base
	self.table_name = "historico_projeto"
	self.primary_key = "id_hist_proj"
	has_many :projects
end
