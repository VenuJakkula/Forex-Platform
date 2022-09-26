$(document).ready(function(){
	var to1country;
	var to2country;
	var to3country;
	var fromcountry;
	var fromvalue=0;
	var frominvalue=0;
	var to1value=0;
	var to2value=0;
	var to3value=0;
	var date=$('#date').children("option:selected").val();
	$('#date').on('change', function() {
		date=this.value;
		if(frominvalue>0){
			$.get("/ForexPlatform/getCurrency",{country:fromcountry,date:date},function(fromCur){
			      fromvalue=fromCur;
			  });
			  $.get("/ForexPlatform/getCurrency",{country:to1country,date:date},function(to1Cur){
			      to1value=to1Cur;
			      $('#to1amt').val(frominvalue*fromvalue/to1value);
			  });
			  $.get("/ForexPlatform/getCurrency",{country:to2country,date:date},function(to2Cur){
			      to2value=to2Cur;
			      $('#to2amt').val(frominvalue*fromvalue/to2value);
			  });
			  $.get("/ForexPlatform/getCurrency",{country:to3country,date:date},function(to3Cur){
			      to3value=to3Cur;
			      $('#to3amt').val(frominvalue*fromvalue/to3value);
			  });
		}
	});
$('#fromamt').keyup(function() {
	to1country=$('#to1').children("option:selected").val();
	to2country=$('#to2').children("option:selected").val();
	to3country=$('#to3').children("option:selected").val();
	fromcountry=$('#from').children("option:selected").val();
	  frominvalue=document.getElementById("fromamt").value;
	  $.get("/ForexPlatform/getCurrency",{country:fromcountry,date:date},function(fromCur){
	      fromvalue=fromCur;
	  });
	  $.get("/ForexPlatform/getCurrency",{country:to1country,date:date},function(to1Cur){
	      to1value=to1Cur;
	      $('#to1amt').val(frominvalue*fromvalue/to1value);
	  });
	  $.get("/ForexPlatform/getCurrency",{country:to2country,date:date},function(to2Cur){
	      to2value=to2Cur;
	      $('#to2amt').val(frominvalue*fromvalue/to2value);
	  });
	  $.get("/ForexPlatform/getCurrency",{country:to3country,date:date},function(to3Cur){
	      to3value=to3Cur;
	      $('#to3amt').val(frominvalue*fromvalue/to3value);
	  });
	  
});

$('#to1').on('change', function() {
	to1country=this.value;
	    	  $.get("/ForexPlatform/getCurrency",{country:this.value,date:date},function(to1data){
	    	      $('#to1amt').val((frominvalue*fromvalue)/to1data);
	    	  });
});
$('#to2').on('change', function() {
	to2country=this.value;
	    	  $.get("/ForexPlatform/getCurrency",{country:this.value,date:date},function(to2data){
	    	      $('#to2amt').val((frominvalue*fromvalue)/to2data);
	    	  });
});
$('#to3').on('change', function() {
	to3country=this.value;
	    	  $.get("/ForexPlatform/getCurrency",{country:this.value,date:date},function(to3data){
	    	      $('#to3amt').val((frominvalue*fromvalue)/to3data);
	    	  });
});

$('#from').on('change', function() {
	fromcountry=this.value;
	to1country=$('#to1').children("option:selected").val();
	to2country=$('#to2').children("option:selected").val();
	to3country=$('#to3').children("option:selected").val();
	$.get("/ForexPlatform/getCurrency",{country:this.value,date:date},function(fromCur){
	      fromvalue=fromCur;
	  });
	  $.get("/ForexPlatform/getCurrency",{country:to1country,date:date},function(to1Cur){
	      to1value=to1Cur;
	      $('#to1amt').val(frominvalue*fromvalue/to1value);
	  });
	  $.get("/ForexPlatform/getCurrency",{country:to2country,date:date},function(to2Cur){
	      to2value=to2Cur;
	      $('#to2amt').val(frominvalue*fromvalue/to2value);
	  });
	  $.get("/ForexPlatform/getCurrency",{country:to3country,date:date},function(to3Cur){
	      to3value=to3Cur;
	      $('#to3amt').val(frominvalue*fromvalue/to3value);
	  });
});


});