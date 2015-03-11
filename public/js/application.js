$(document).ready(function() {
	if($("#users_json").length){
   	// if page contains id #users_json 
   	console.log("yup");
   	$.ajax({
   		url: "/users.json",
   		type: "get",
   		success: function(response){
   			var userArray = [];
   			$.each(response, function( i, user ) {
   				var newUser = new userObject(user);
   				userArray.push(newUser)
   			});

   			$.each(userArray, function( i, user ) {
   				$('#user_place').append(user.buildThumbnail());

   			});


   		},
   		error: function(response){
   		}
   	})
   }
   $('#login_ajax').submit(function(e){
   	e.preventDefault();
   	$.ajax({
   		url: "/login_ajax",
   		type: "post",
   		data: $(this).serialize(),
   		success: function(response){
   			$('#rightnav').html(buildRightNav(response));
   			 $('#loginModal').modal('toggle');

   		},
   		error: function(response){
   			$('.error').html('The username or password is incorrect')
   		}
   	})

   });
   


});


var userObject = function(user){
	this.username = user.username;
	this.avatar = user.avatar;
	this.first_name = user.first_name;
	this.last_name = user.last_name;
	this.email = user.email;
	this.buildThumbnail = function(){

		return 	'<div class="col-sm-6 col-md-4">' +
		'<div class="thumbnail">' +
		'<img src="'+ this.avatar + '" alt="">' +
		'<div class="caption">' +
		'<h3>'+ this.fullname() +'</h3>' +
		'<p>Email: '+ this.email +' </p>' +
		'<p>Username:'+ this.username + ' </p>' +
		'</div>' +
		'</div>' +
		'</div>' 
	};
	this.fullname = function(){
		return this.first_name + " " + this.last_name;
	}


}

var buildRightNav = function(params){
	return 	'<div class="dropdown">' +
			'<a href="#" class="dropdown-toggle" data-toggle="dropdown">' +
			'<img src="'+ params.avatar +'" class="profile-image img-circle"> '+ params.username +' <i class="caret"></i></a>' +
			'<ul class="dropdown-menu">' +
			'<li><a href="/events"><i class="fa fa-diamond"></i> All Events</a></li>' +
			'<li class="divider"></li>' +
			'<li><a href="/users"><i class="fa fa-users"></i> All Users</a></li>' +
			'<li class="divider"></li>' +
			'<li><a href="/users/'+ params.user_id +'"><i class="fa fa-rocket"></i> User Dashboard</a></li>' +
			'<li class="divider"></li>' +
			'<li><a href="/account_settings"><i class="fa fa-cog"></i> Edit Account</a></li>' +
			'<li class="divider"></li>' +
			'<li><a href="/logout"><i class="fa fa-sign-out"></i> Sign-out</a></li>' +
			'</ul>'
}