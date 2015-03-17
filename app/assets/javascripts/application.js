// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

	function Chamar_upload (tipo){
		$("#upload_"+tipo).show(); 
	}
	
	function VerificaFormato(opt)
	{
		if(opt == 'Outros')
		{
			$("#campo_formato_outro").show('slow')
		}
		else
		{
			$("#formato_outro").val('');	
			$("#campo_formato_outro").hide('slow')
		}		
	}
	
	function VerificaFormato2(opt) 
	{
		if(opt == 'Outros')
		{
			$("#campo_formato_outro2").show('slow')
		}
		else
		{
			$("#formato_outro2").val('');	
			$("#campo_formato_outro2").hide('slow')
		}		
	}	
	
	function addFormato(v){
		if (v == "Adicionar outro formato"){
			$("#add_outro_formato").val('Remover outro formato')
		}else{
			$("#add_outro_formato").val('Adicionar outro formato')
			$("#formato2").find("option:first").attr("selected", true);
			$("#formato_outro2").val('');
			$("#campo_formato_outro2").hide('slow')
		}		
		$("#formato2").toggle('slow');
	}
	$(document).ready(function() {
		$("input[value='Adicionar outro formato']").click(function(e) {
			e.preventDefault();
			//alert("Hassan");
		});

		
	});

	function DesmarcaOptLinguagem()
	{
		$('.opt_linguagem').prop('checked', false);	   
	}
