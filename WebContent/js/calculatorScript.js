$(document).ready(function(){
	var value1=0;
	var value2=0;
	var value3=0;
	var country1;
	var country4;
	var res=0;
	var date=$('#date').children("option:selected").val();
	$('#date').on('change', function() {
		date=this.value;
		
	});
$('#s1').on('change', function() { 
	$.get("/ForexPlatform/getCurrency",{country:this.value,date:date},function(curval1){
  	  value1=document.getElementById("input1").value;
  	  value1=value1*curval1;
  	  if($('#check1m').prop('checked')){
  		  value1=-value1;
  	  }
	});
	
	country4=$('#s4').children("option:selected").val();
	$.get("/ForexPlatform/getCurrency",{country:country4,date:date},function(curval4){
	  	res=value1+value2+value3;
	  	res=res/curval4;
	  	$('#input4').val(res);
	});
});
	  
$('#input1').keyup(function() {
	country1=$('#s1').children("option:selected").val();
	    $.get("/ForexPlatform/getCurrency",{country:country1,date:date},function(curval1){
	    	  value1=document.getElementById("input1").value;
	    	  value1=value1*curval1;
	    	  if($('#check1m').prop('checked')){
	    		  value1=-value1;
	    	  }
	    });
	 country4=$('#s4').children("option:selected").val(); 
	  $.get("/ForexPlatform/getCurrency",{country:country4,date:date},function(curval4){
		  	res=value1+value2+value3;
		  	res=res/curval4;
		  	$('#input4').val(res);
	      
	  });
});
 

$('#s2').on('change', function() { 
	$.get("/ForexPlatform/getCurrency",{country:this.value,date:date},function(curval2){
  	  value2=document.getElementById("input2").value;
  	  value2=value2*curval2;
  	  if($('#check2m').prop('checked')){
  		  value2=-value2;
  	  }
	});
	
	country4=$('#s4').children("option:selected").val();
	$.get("/ForexPlatform/getCurrency",{country:country4,date:date},function(curval4){
	  	res=value1+value2+value3;
	  	res=res/curval4;
	  	$('#input4').val(res);
	});
}); 

$('#input2').keyup(function() {
	country2=$('#s2').children("option:selected").val();
	    $.get("/ForexPlatform/getCurrency",{country:country2,date:date},function(curval2){
	    	  value2=document.getElementById("input2").value;
	    	  value2=value2*curval2;
	    	  if($('#check2m').prop('checked')){
	    		  value2=-value2;
	    	  }
	    });
	 country4=$('#s4').children("option:selected").val(); 
	  $.get("/ForexPlatform/getCurrency",{country:country4,date:date},function(curval4){
		  	res=value1+value2+value3;
		  	res=res/curval4;
		  	$('#input4').val(res);
	      
	  });
});

$('#s3').on('change', function() { 
	$.get("/ForexPlatform/getCurrency",{country:this.value,date:date},function(curval3){
  	  value3=document.getElementById("input3").value;
  	  value3=value3*curval3;
  	  if($('#check3m').prop('checked')){
  		  value3=-value3;
  	  }
	});
	
	country4=$('#s4').children("option:selected").val();
	$.get("/ForexPlatform/getCurrency",{country:country4,date:date},function(curval4){
	  	res=value1+value2+value3;
	  	res=res/curval4;
	  	$('#input4').val(res);
	});
}); 

$('#input3').keyup(function() {
	country3=$('#s3').children("option:selected").val();
	    $.get("/ForexPlatform/getCurrency",{country:country3,date:date},function(curval3){
	    	  value3=document.getElementById("input3").value;
	    	  value3=value3*curval3;
	    	  if($('#check3m').prop('checked')){
	    		  value3=-value3;
	    	  }
	    });
	 country4=$('#s4').children("option:selected").val(); 
	  $.get("/ForexPlatform/getCurrency",{country:country4,date:date},function(curval4){
		  	res=value1+value2+value3;
		  	res=res/curval4;
		  	$('#input4').val(res);
	      
	  });
}); 

$('#s4').on('change', function() {
	  $.get("/ForexPlatform/getCurrency",{country:this.value,date:date},function(curval4){
		  	res=value1+value2+value3;
		  	res=res/curval4;
		  	$('#input4').val(res);
	  });
});

$('#check1m').click(function() {
	$('#p1').html('Minus');
});
$('#check2m').click(function() {
	$('#p2').html('Minus');
});
$('#check3m').click(function() {
	$('#p3').html('Minus');
});
	
});