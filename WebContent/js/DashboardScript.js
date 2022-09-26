$(document).ready(function(){
	var from=0;
	var to=0;
	var fromcountry;
	var tocountry;
	var fromamt=0;
	var date=$('#date').children("option:selected").val();
	$('#date').on('change', function() {
		date=this.value;
		
	});
	$('#cons1').on('change', function() {
		tocountry=$('#cons2').children("option:selected").val();
		$.get("/ForexPlatform/getCurrency",{country:this.value,date:date},function(fromvalue){
			from=fromvalue;
  	  	});
		$.get("/ForexPlatform/getCurrency",{country:tocountry,date:date},function(fromvalue){
			to=fromvalue;
			$('#conin2').val((from*fromamt)/to);
  	  	});
	});
	$('#cons2').on('change', function() {
		fromcountry=$('#cons1').children("option:selected").val();
		$.get("/ForexPlatform/getCurrency",{country:fromcountry,date:date},function(fromvalue){
			from=fromvalue;
  	  	});
		$.get("/ForexPlatform/getCurrency",{country:this.value,date:date},function(fromvalue){
			to=fromvalue;
			$('#conin2').val((from*fromamt)/to);
  	  	});
	});
	$('#conin1').keyup(function() {
		fromamt=this.value;
		fromcountry=$('#cons1').children("option:selected").val();
		tocountry=$('#cons2').children("option:selected").val();
		$.get("/ForexPlatform/getCurrency",{country:fromcountry,date:date},function(fromvalue){
			from=fromvalue;
  	  	});
		$.get("/ForexPlatform/getCurrency",{country:tocountry,date:date},function(fromvalue){
			to=fromvalue;
			$('#conin2').val((from*fromamt)/to);
  	  	});
		
	});
	
/*calculator script from here*/
	var value1=0;
	var value2=0;
	var calres=0;
	var country3;
	var country1;
	var country2;
$('#cals1').on('change', function() {
	  $.get("/ForexPlatform/getCurrency",{country:this.value,date:date},function(curval1){
	    	  value1=document.getElementById("calin1").value;
	    	  value1=parseInt(value1)*curval1;
	    	  if($('#check1m').prop('checked')){
	    		  value1=-value1;
	    	  }
	  });
	  country3=$('#cals3').children("option:selected").val();
	  $.get("/ForexPlatform/getCurrency",{country:country3,date:date},function(curval3){
		  calres=value1+value2;
		  calres=calres/curval3;
		  $('#calin3').val(calres);
	  	});  
}); 
$('#calin1').keyup(function() {
	country1=$('#cals1').children("option:selected").val();
    $.get("/ForexPlatform/getCurrency",{country:country1,date:date},function(curval1){
    	  value1=document.getElementById("calin1").value;
    	  value1=value1*curval1;
    	  if($('#check1m').prop('checked')){
    		  value1=-value1;
    	  }
    });
 country3=$('#cals3').children("option:selected").val(); 
  $.get("/ForexPlatform/getCurrency",{country:country3,date:date},function(curval4){
	  	calres=value1+value2;
	  	calres=calres/curval4;
	  	$('#calin3').val(calres);
  });
});
$('#cals2').on('change', function() {
	$.get("/ForexPlatform/getCurrency",{country:this.value,date:date},function(curval1){
  	  value2=document.getElementById("calin2").value;
  	  value2=parseInt(value2)*curval1;
  	  if($('#check2m').prop('checked')){
  		  value2=-value2;
  	  }
	});
	country3=$('#cals3').children("option:selected").val();
	$.get("/ForexPlatform/getCurrency",{country:country3,date:date},function(curval3){
	  calres=value1+value2;
	  calres=calres/curval3;
	  $('#calin3').val(calres);
	}); 
}); 

$('#calin2').keyup(function() {
	country2=$('#cals2').children("option:selected").val();
    $.get("/ForexPlatform/getCurrency",{country:country2,date:date},function(curval1){
    	  value2=document.getElementById("calin1").value;
    	  value2=value2*curval1;
    	  if($('#check2m').prop('checked')){
    		  value2=-value2;
    	  }
    });
 country3=$('#cals3').children("option:selected").val(); 
  $.get("/ForexPlatform/getCurrency",{country:country3,date:date},function(curval4){
	  	calres=value1+value2;
	  	calres=calres/curval4;
	  	$('#calin3').val(calres);
  });
});

$('#cals3').on('change', function() {
	  $.get("/ForexPlatform/getCurrency",{country:this.value,date:date},function(curval3){
		  	var value3=value1+value2;
		  	var res=value3/curval3;
		  	$('#calin3').val(res);
	  });
}); 

	
});