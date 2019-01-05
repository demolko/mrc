
$(document).ready(function(){
	$( "#tasks_modal_button" ).click(function() {
		show_crm_tasks();
	});

	$("#add_new_user").click(function(){
		var buttons = "";
		var content = "<form>"+
		sm_label_input('Podaj login','Login','<br/>')+
		sm_label_input('Podaj hasło','Password','<br/>')+
		sm_label_input('Powtórz hasło','Password2','<br/>')+
		sm_label_input('Podaj imię','Name','<br/>')+
		sm_label_input('Podaj nazwisko','Surname','<br/>')+
		sm_label_input('Podaj numer telefonu','Phone','<br/>')+
		sm_label_input('Podaj e-mail','E_mail','<br/>')+
		"<label><span>Podaj stanowisko</span></label><br/><select class='form_field' name='position'>"+
		"<option value='2'>Admin</option>"+
		"<option value='3'>Sprzedaź</option>"+
		"<option value='4'>IT</option>"+
		"<option value='5'>Fotograf</option>"+
		"</select></form>"+
		"<div id='add_user' class='dark_button_modal' onclick='add_user()'>Dodaj</div>";
		show_modal_window("Dodawanie użytkownika", content, buttons,"#tasks_modal_button");	
	});

	$("#add_new_business").click(function(){
		var buttons = "";
		var content = "<form>"+
		sm_label_input('Nazwa','Name','<br/>')+
		sm_label_input('Telefon','Phone','<br/>')+
		sm_label_input('E-mail','E_mail','<br/>')+
		sm_label_input('Ulica','Street','<br/>')+
		sm_label_input('Miasto','City','<br/>')+
		sm_label_input('Województwo','Province','<br/>')+
		sm_label_input('Kod pocztowy','Code_post','<br/>')+
		sm_label_input('Branża','Trade','<br/>')+
		sm_label_input('Strona www','WWW','<br/>')+
		"</form><div id='add_user' class='dark_button_modal' onclick='add_business()'>Dodaj</div>";
		show_modal_window("Dodawanie firmy", content, buttons,"#tasks_modal_button");
	});

	$('#search_field').keypress(function(event){
		if(event.keyCode == 13){
			search_business($('input[id=search_field]').val());
			$('#search_field').blur();
		}
	});

	$('.user-settings').click(function(){
		if($('.dropdown_user_settings').is(':visible')){
			$('.dropdown_user_settings').fadeOut( 300 );
		}
		else{
			$('.dropdown_user_settings').fadeIn( 300 );
		}
	});

});

function sm_label_input(text, name, new_line='', value=''){
	if(value!='')value = " value=" + value;
	return "<label><span>"+text+"</span></label><br/><input class='form_field' name='"+name+"' "+value+" />"+new_line+"";
}

function modal_remove(id){
	$(id).remove();
}

function post_ajax_query(data_content, src, message, modal_id){
	$.ajax({
		type: "POST", 
		url: src, 
		data: data_content,
		success: function(data) {
			$('#message_info').after('<div id="messsage_shown">'+message+'</div>');
			setTimeout(function() { $("#messsage_shown").remove() }, 3000);
			if(modal_id != '')modal_remove(modal_id);
		}
	});
}

function fields_values(array_values){
	var new_array_values = '';

	array_values.forEach(function(value) {
		new_array_values = new_array_values + '' + $(value).val() + ',';
	});

	return new_array_values.substr(0,new_array_values.length-1);
}

function show_modal_window(title, content, buttons, where_show, constant_id=''){
	if(constant_id==''){
		var mv_id = 'mv' + Math.floor(Math.random() * 10000) + '' + Math.floor(Math.random() * 10000);
	}
	else{
		var mv_id = constant_id;	
	}
	var txt2 = "<div class='modal' id='"+mv_id+"'>"+
	"<div class='modal__dialog'><section class='modal__content'>"+
	"<header class='modal__header'><h2 class='modal__title'>"+title+"</h2>"+
	"<div id='tasks_modal_close' onclick='modal_remove("+mv_id+")'>x</div></header>"+
	"<div class='modal__body'><p class='modal__text' style='max-width:80%;'>"+content+"</p>"+
	buttons+"</div>"+
	"</section></div></div>";
	$(where_show).after(txt2);
}

function confirmation_window(text, text_content){

	return new Promise((resolve, reject) => {

		var content = "<div style='font-size: 14px; text-align:center;'>"+
		"<div style='margin-bottom: 10px;'>Usunąć wskazanego użytkownika?</div>"+
		"<div id='yes_confirm_button' class='button_confirm' >Tak</div>"+
		"<div id='no_confirm_button' class='button_confirm' >Nie</div></div>";

		var txt2 = "<div class='modal' id='choice_modal'><div class='modal__dialog'><section class='modal__content'>"+
		"<header class='modal__header'><h2 class='modal__title'>"+text+"</h2></header>"+
		"<div class='modal__body'><p class='modal__text' style='max-width:80%;'>"+content+"</p></div>"+
		"</section></div></div>";
		$('#tasks_modal_button').after(txt2);

		$('#yes_confirm_button').click(function() {
			resolve();
		});

		$('#no_confirm_button').click(function() {
			reject();
		});

	});
}

function add_new_task(modalid){
	var array_values = ['input[name=Temat]', 'input[name=Opis]', 'select[name=priority]'];
	var new_array_values = fields_values(array_values).split(",");

	var data_content = "tematwar="+new_array_values[0]+"&opiswar="+new_array_values[1]+"&prioritywar="+new_array_values[2]+"";
	post_ajax_query(data_content,"ajax/modules/orders_crm/upload.php", 'Dodano zadanie CRM', "#add_tasks_modal");
	setTimeout('modal_remove(submodal_add_crm_task)', 300);
	setTimeout('modal_remove(CRM_task_list)', 300);
	setTimeout('show_crm_tasks()', 300);
}

function add_tasks_modal(){
	var buttons = "";
	var content = "<form><input class='form_field' name='Temat'/>Podaj temat<br />"+
	"<input class='form_field' name='Opis' />Podaj opis<br />"+
	"<select class='form_field' name='priority'>"+
	"<option value='new'>Nowe</option>"+
	"<option value='normal'>Normalne</option>"+
	"<option value='important'>Ważne</option>"+
	"</select>Podaj priority</form>"+
	"<div id='add_task_button' class='dark_button_modal' onclick='add_new_task()'>Dodaj</div>";
	show_modal_window("Dodawanie zadania CRM", content, buttons,"#CRM_task_list", "submodal_add_crm_task");
}

function end_task_in_modal(war1,war2){
	var data_content = "end_task="+war1+"";
	post_ajax_query(data_content,"ajax/modules/orders_crm/end_task.php", "Zakończono zadanie CRM","");
	war2.parentElement.style.display='none';
}

function add_user(){
	var array_values = ['input[name=Login]', 'input[name=Password]', 'input[name=Password2]', 'input[name=Name]', 'input[name=Surname]', 'input[name=Phone]', 'input[name=E_mail]', 'select[name=position]'];
	var new_array_values = fields_values(array_values).split(",");

	var data_content = "loginwar="+new_array_values[0]+"&passwordwar="+new_array_values[1]+"&password2war="+new_array_values[2]+"&namewar="+new_array_values[3]+"&surnamewar="+new_array_values[4]
	+"&phonewar="+new_array_values[5]+"&e_mailwar="+new_array_values[6]+"&positionwar="+new_array_values[7]+"";
	post_ajax_query(data_content,"ajax/modules/users/add.php", 'Dodano użytkownika', "#add_user_modal");
	setTimeout('location.reload(true)', 500);
}

function delete_user(war1,war2){
	confirmation_window("Usuwanie użytkownika")
	.then(
		result => { 
			var data_content = "delete_user="+war1+"";
			post_ajax_query(data_content,"ajax/modules/users/delete.php", "Usunięto użytkownika","");
			war2.parentElement.style.display='none';
			$('#choice_modal').remove();
		}
		)
	.catch(err => {
		alert("Nie usunięto użytkownika");
		$('#choice_modal').remove();
	});
}

function edit_user_in_modal(war1){
	$.ajax({
		method: "POST", 
		url: "ajax/modules/users/edit/download.php",
		data: "user_id="+war1+"",
	}).done(function( data ) {
		var data_table = data.split(";");
		var buttons = "";
		var content = "<form>"+
		sm_label_input('Podaj login','Login','<br/>', data_table[0])+
		sm_label_input('Podaj imię','Name','<br/>', data_table[2])+
		sm_label_input('Podaj nazwisko','Surname','<br/>', data_table[3])+
		sm_label_input('Podaj numer telefonu','Phone','<br/>', data_table[4])+
		sm_label_input('Podaj adres e-mail','E_mail','<br/>', data_table[5])+
		"<label><span>Podaj stanowisko</span></label><br/><select class='form_field' name='position'>"+
		"<option value='2'>Admin</option>"+
		"<option value='3'>Sprzedaź</option>"+
		"<option value='4'>IT</option>"+
		"<option value='5'>Fotograf</option>"+
		"</select></form>"+
		"<div id='add_user' class='dark_button_modal' onclick='edit_user("+data_table[7]+")'>Edytuj</div>";
		show_modal_window("Edycja użytkownika", content, buttons,"#tasks_modal_button");
	});
}

function password_user_in_modal(war1){
	$.ajax({
		method: "POST", 
		url: "ajax/modules/users/edit/download.php",
		data: "user_id="+war1+"",
	}).done(function( data ) {
		var data_table = data.split(";");
		var buttons = "";
		var content = "<form>"+
		sm_label_input('Podaj hasło','Password','<br/>')+
		sm_label_input('Powtórz hasło','Password2','<br/>')+
		"</form><div id='edit_user_password' class='dark_button_modal' onclick='edit_user_password("+data_table[7]+")'>Edytuj</div>";
		show_modal_window("Zmiana hasła użytkownika", content, buttons,"#tasks_modal_button");
	});
}

function edit_user_password(war_id){
	var array_values = ['input[name=Password]', 'input[name=Password2]'];
	var new_array_values = fields_values(array_values).split(",");

	if(new_array_values[0] === new_array_values[1]){
		var data_content = "passwordwar="+new_array_values[0]+"&idwar="+war_id+"";
		post_ajax_query(data_content,"ajax/modules/users/edit/password.php", 'Edytowano hasło użytkownika,<br/> odśwież przeglądarkę', "#password_user_modal");
	}
	else{
		alert('Hasła się różnią');
	}
}

function edit_user(war_id){
	var array_values = ['input[name=Login]', 'input[name=Password]', 'input[name=Password2]', 'input[name=Name]', 'input[name=Surname]', 'input[name=Phone]', 'input[name=E_mail]', 'select[name=position]'];
	var new_array_values = fields_values(array_values).split(",");

	var data_content = "loginwar="+new_array_values[0]+"&passwordwar="+new_array_values[1]+"&password2war="+new_array_values[2]+"&namewar="+new_array_values[3]+"&surnamewar="+new_array_values[4]
	+"&phonewar="+new_array_values[5]+"&e_mailwar="+new_array_values[6]+"&positionwar="+new_array_values[7]+"&idwar="+war_id+"";

	post_ajax_query(data_content,"ajax/modules/users/edit/edit.php", 'Edytowano użytkownika,<br/> odśwież przeglądarkę', "#add_user_modal");
}

function show_business(war1){
	$.ajax({
		method: "POST", 
		url: "ajax/modules/business/show.php",
		data: "customer_id="+war1+"",
	}).done(function( data ) {
		var data_table = data.split(";");
		var buttons = "";

		const status_db = [];

		for(var i = 1; i < 11; i++){
			status_db[i] = '';
			if(data_table[13] == i) status_db[i] = 'selected';
		}

		var status_select = "<label><span>Status</span></label><br/><select class='form_field' name='status'>";
		status_select = status_select + "<option value='1'"+ status_db[1] + ">Zlecenie</option>";
		status_select = status_select + "<option value='2'"+ status_db[2] + ">Rokujące</option>";
		status_select = status_select + "<option value='3' "+ status_db[3] + " >Oferta podstawowa</option>";
		status_select = status_select + "<option value='4' "+ status_db[4] + " >Odmowa</option>";
		status_select = status_select + "<option value='5' "+ status_db[5] + " >Nie odbiera</option>";
		status_select = status_select + "<option value='6' "+ status_db[6] + " >Nie aktualne</option>";
		status_select = status_select + "<option value='7' "+ status_db[7] + " >Zrealizowano</option>";
		status_select = status_select + "<option value='8' "+ status_db[8] + " >Zdjęcia</option>";
		status_select = status_select + "<option value='9' "+ status_db[9] + " >Brak zdjęć</option>";
		status_select = status_select + "<option value='10' "+ status_db[10] + " >Obróbka</option>";
		status_select = status_select + "</select>";
		var price = sm_label_input('Cena','price','',data_table[11]);
		var text_area = "<label><span>Opis</span></label><br/><textarea class='form_field' name='business_desc' rows='4' style='width: 90%;'>"+data_table[12]+"</textarea>";
		var date = "<label><span>Data</span></label><br/><input class='form_field' type='date' name='end_date' value='"+data_table[10]+"'>";


		var content = "<div style='width: 50%; float: left;'>"+
		"<div class='show_business_naglowek'>Nazwa:</div><div class='show_business_wartosc'>"+data_table[0]+
		"</div><div class='show_business_naglowek'>Telefon:</div><div class='show_business_wartosc'>"+data_table[1]+
		"</div><div class='show_business_naglowek'>E-mail:</div><div class='show_business_wartosc'>"+data_table[2]+
		"</div><div class='show_business_naglowek'>Ulica:</div><div class='show_business_wartosc'>"+data_table[3]+
		"</div><div class='show_business_naglowek'>Miasto:</div><div class='show_business_wartosc'>"+data_table[4]+
		"</div><div class='show_business_naglowek'>Województwo:</div><div class='show_business_wartosc'>"+data_table[5]+
		"</div><div class='show_business_naglowek'>Kod pocztowy:</div><div class='show_business_wartosc'>"+data_table[6]+
		"</div><div class='show_business_naglowek'>Branża:</div><div class='show_business_wartosc'>"+data_table[7]+
		"</div><div class='show_business_naglowek'>Strona www:</div><div class='show_business_wartosc'>"+data_table[8]+
		"</div></div><div style='width: 50%; float: left;'><form>"+status_select+"<br />"+price+"<br/>"+text_area+"<br/>"+date+
		"</form><div id='add_user' class='dark_button_modal' style='position:unset;' onclick='add_business_status("+war1+")'>Zaktualizuj</div></div><p style='clear:both;'></p>";
		show_modal_window("Dane firmy", content, buttons,"#tasks_modal_button");
	});
}

function add_business(){
	var array_values = ['input[name=Name]', 'input[name=Phone]', 'input[name=E_mail]', 'input[name=Street]', 'input[name=City]', 'input[name=Province]', 'input[name=Code_post]', 'input[name=Trade]', 'input[name=WWW]'];
	var new_array_values = fields_values(array_values).split(",");

	var data_content = "nazwawar="+new_array_values[0]+"&telefonwar="+new_array_values[1]+"&e_mailwar="+new_array_values[2]+"&ulicawar="+new_array_values[3]+"&miastowar="+new_array_values[4]
	+"&wojewodztwowar="+new_array_values[5]+"&kod_pocztowywar="+new_array_values[6]+"&branzawar="+new_array_values[7]+"&www="+new_array_values[8]+"";
	post_ajax_query(data_content,"ajax/modules/business/add.php", 'Dodano biznes', "#add_user_modal");
	setTimeout('location.reload(true)', 500);
}

function edit_business_in_modal(war1){
	$.ajax({
		method: "POST", 
		url: "ajax/modules/business/edit/download.php",
		data: "customer_id="+war1+"",
	}).done(function( data ) {
		var data_table = data.split(";");
		var buttons = "";
		var content = "<form>"+
		sm_label_input('Nazwa','Nazwa','<br/>', data_table[0])+
		sm_label_input('Telefon','Telefon','<br/>', data_table[1])+
		sm_label_input('E-mail','E_mail','<br/>', data_table[2])+
		sm_label_input('Ulica','Ulica','<br/>', data_table[3])+
		sm_label_input('Miasto','Miasto','<br/>', data_table[4])+
		sm_label_input('Województwo','Wojewodztwo','<br/>', data_table[5])+
		sm_label_input('Kod pocztowy','Kod_pocztowy','<br/>', data_table[6])+
		sm_label_input('Branża','Branza','<br/>', data_table[7])+
		sm_label_input('Strona www','www','<br/>', data_table[8])+
		"</form><div id='add_user' class='dark_button_modal' onclick='edit_business("+data_table[9]+")'>Edytuj</div>";
		show_modal_window("Edycja firmy", content, buttons,"#tasks_modal_button");
	});
}

function edit_business(war_id){
	var array_values = ['input[name=Nazwa]', 'input[name=Telefon]', 'input[name=E_mail]', 'input[name=Ulica]', 'input[name=Miasto]', 'input[name=Wojewodztwo]', 'input[name=Kod_pocztowy]', 'input[name=Branza]', 'input[name=www]'];
	var new_array_values = fields_values(array_values).split(",");

	var data_content = "nazwawar="+new_array_values[0]+"&telefonwar="+new_array_values[1]+"&e_mailwar="+new_array_values[2]+"&ulicawar="+new_array_values[3]+"&miastowar="+new_array_values[4]
	+"&wojewodztwowar="+new_array_values[5]+"&kod_pocztowywar="+new_array_values[6]+"&branzawar="+new_array_values[7]+"&www="+new_array_values[8]+"&business_id="+war_id+"";
	post_ajax_query(data_content,"ajax/modules/business/edit/edit.php", 'Edytowano biznes,<br/> odśwież przeglądarkę', "#add_user_modal");
}

function add_business_status(war_id){
	var array_values = ['select[name=status]', 'input[name=price]', 'textarea[name=business_desc]', 'input[name=end_date]'];
	var new_array_values = fields_values(array_values).split(",");

	var data_content = "statuswar="+new_array_values[0]+"&pricewar="+new_array_values[1]+"&descwar="+new_array_values[2]+"&enddateawar="+new_array_values[3]+"&business_id="+war_id+"";
	post_ajax_query(data_content,"ajax/modules/business/add_status.php", 'Zmieniono status biznesu', "#add_user_modal");
}

function search_business(war){
	$.ajax({
		type: "POST", 
		url: "ajax/modules/search/search.php", 
		data: "search="+war+"",
		success: function(data) {
			var data_table = data.split(";");
			var i=0;
			var content='';
			while (data_table[i] != 'end') { 
				if(i==0){
					content = '<div class="search_content" style="background-color: #888888;">'+
					'<p class="search_content_field" style="color: #ffffff;">Nazwa</p>'+
					'<p class="search_content_field" style="color: #ffffff;">Telefon</p>'+
					'<p class="search_content_field" style="color: #ffffff;">E-mail</p>'+
					'<p class="search_content_field" style="color: #ffffff;">Miasto</p></div>';
				}
				content = content +  '<div class="search_content"><p class="search_content_field">' + data_table[i] + 
				'</p><p class="search_content_field">' + data_table[i+1] + 
				'</p><p class="search_content_field">' + data_table[i+2] + 
				'</p><p class="search_content_field">' + data_table[i+3] + 
				'</p></div><hr class="hr_search"/>';
				i=i+4;
			}

			if(i==0){
				content = '<div class="search_no_result_text">Brak rezultatów</div>';
			}

			var buttons = ''
			show_modal_window("Wyszukiwarka biznesu", content, buttons,"#tasks_modal_button");
		}
	});
}

function show_crm_tasks(){
	var content = "";

	$.ajax({
		method: "GET", 
		url: "ajax/modules/orders_crm/download.php", 
	}).done(function( data ) {
		content = data;
		var buttons = "<div id='add_task_crm_button' class='dark_button_modal' onclick='add_tasks_modal()'>Dodaj</div>";
		show_modal_window("Zadania CRM", content, buttons,"#tasks_modal_button","CRM_task_list");	
	});
}