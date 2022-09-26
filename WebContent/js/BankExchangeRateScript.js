$(document).ready(function(){
	var html="";
	var country=$('#select').children("option:selected").val();
	$.ajax({ 
        type: 'GET', 
        url: '/ForexPlatform/BanksbyCountry', 
        data: { country: country }, 
        success: function (data) { 
            var names = data;
            $.each( names, function( index, value ){
            	html+="<tr><td>"+value.name+"</td><td>"+value.buyCash+"</td><td>"+
            		  value.sellCash+"</td><td>"+value.buyNonCash+"</td><td>"+
            		  value.sellNonCash+"</td></tr>"
            });
             
            $("#tableBody").html(html);
        }
    });
$('#select').on('change', function() {
		html="";
	  $.ajax({ 
	        type: 'GET', 
	        url: '/ForexPlatform/BanksbyCountry', 
	        data: { country: this.value }, 
	        success: function (data) { 
	            var names = data;
	            $.each( names, function( index, value ){
	            	html+="<tr><td>"+value.name+"</td><td>"+value.buyCash+"</td><td>"+
	            		  value.sellCash+"</td><td>"+value.buyNonCash+"</td><td>"+
	            		  value.sellNonCash+"</td></tr>"
	            });
	             
	            $("#tableBody").html(html);
	        }
	    });
});
});