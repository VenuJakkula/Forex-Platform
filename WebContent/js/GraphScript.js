$(document).ready(function(){
	var country=$('#select1').children("option:selected").val();
	var country2=$('#select2').children("option:selected").val();
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	title:{
		text: "Currency Up Downs"
	},
	axisX: {
		valueFormatString: "DD MMM,YY"
	},
	axisY: {
		title: "Currency Value",
		includeZero: false,
		suffix: " "
	},
	legend:{
		cursor: "pointer",
		fontSize: 16,
		itemclick: toggleDataSeries
	},
	toolTip:{
		shared: true
	},
	data: [{
		name: "country1",
		type: "spline",
		yValueFormatString: "#0.## ",
		showInLegend: true,
		dataPoints: []
	
	},{
		name: "country2",
		type: "spline",
		yValueFormatString: "#0.## ",
		showInLegend: true,
		dataPoints: []
	}
	]
});
chart.render();
$.ajax({ 
    type: 'GET', 
    url: '/ForexPlatform/getGraph', 
    data: {country:"USA" }, 
    success: function (data) { 
    	var obj=data;
    	$.each( obj, function( index, value ){
    		chart.options.data[0].dataPoints.push({x:new Date(value.date_of_rec), y:value.currency_value});
    		chart.render();
        });
    }
});
$.ajax({ 
    type: 'GET', 
    url: '/ForexPlatform/getGraph', 
    data: {country:"Europe" }, 
    success: function (data) { 
    	var obj=data;
    	$.each( obj, function( index, value ){
    		chart.options.data[1].dataPoints.push({x:new Date(value.date_of_rec), y:value.currency_value});
    		chart.render();
        });
    }
});

$('#select1').on('change', function() {
	var thiscountry=this.value;
	$.ajax({ 
	    type: 'GET', 
	    url: '/ForexPlatform/getGraph', 
	    data: {country:this.value }, 
	    success: function (data) { 
	    	var obj=data;
	    	chart.options.data[0].dataPoints.pop();
	    	chart.options.data[0].dataPoints.pop();
	    	chart.options.data[0].dataPoints.pop();
	    	chart.options.data[0].dataPoints.pop();
	    	chart.options.data[0].legendText=thiscountry;
	    	$.each( obj, function( index, value ){
	    		chart.options.data[0].dataPoints.push({x:new Date(value.date_of_rec), y:value.currency_value});
	        });
	    	chart.render();
	    }
	});
});
$('#select2').on('change', function() {
	var thiscountry=this.value;
	$.ajax({ 
	    type: 'GET', 
	    url: '/ForexPlatform/getGraph', 
	    data: {country:this.value }, 
	    success: function (data) { 
	    	var obj=data;
	    	chart.options.data[1].dataPoints.pop();
	    	chart.options.data[1].dataPoints.pop();
	    	chart.options.data[1].dataPoints.pop();
	    	chart.options.data[1].dataPoints.pop();
	    	chart.options.data[1].legendText=thiscountry;
	    	$.each( obj, function( index, value ){
	    		chart.options.data[1].dataPoints.push({x:new Date(value.date_of_rec), y:value.currency_value});
	        });
	    	chart.render();
	    }
	});
});
function toggleDataSeries(e){
	if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	}
	else{
		e.dataSeries.visible = true;
	}
	chart.render();
}

});
