class LoginController < ApplicationController
	def login
		if request.post?
			email_contato = params[:email_contato]
			senha = params[:senha]

			if email_contato.blank? && senha.blank?
				flash[:notice] = "Informe usuário e senha"
				return
			end

			if email_contato.blank?
				flash[:notice] = "Informe o usuário"
				return
			end
			if senha.blank?
				flash[:notice] = "Informe a senha"
				return
			end

			@admin = ContatosCliente.find_by(email_contato: email_contato)
			
			if !@admin

				flash[:notice] = "E-mail está errado"
				return
			
			else	
				senha = @admin.senha

				if senha !=""
					if senha != senha
						flash[:notice] = "Senha Inválida"
						return						
					end 
				else
					flash[:notice] = "Seu cadastro foi feito pelo facebook estamos enviando uma nova senha para logar no sistema ou se preferir continue o login pelo facebook"
					return	

				end 
			end
			
			
			flash[:notice] = "Bem-vindo, #{@admin.nome_contato}!"
			session[:id] = @admin.id_contato
			session[:nome_contato] = @admin.nome_contato
			session[:cod_cliente] = @admin.cod_cliente
			redirect_to home_path
		end
	end

	def logout		
		session[:id] = nil
		session[:cod_cliente] = nil
		redirect_to action: :login
	end
end