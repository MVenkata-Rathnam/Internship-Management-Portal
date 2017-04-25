$(document).ready(function(){
	$('#slider1') .cycle({
		fx: 'fade', //'scrollLeft,scrollDown,scrollRight,scrollUp',blindX, blindY, blindZ, cover, curtainX, curtainY, fade, fadeZoom, growX, growY, none, scrollUp,scrollDown,scrollLeft,scrollRight,scrollHorz,scrollVert,shuffle,slideX,slideY,toss,turnUp,turnDown,turnLeft,turnRight,uncover,ipe ,zoom
		speed:  'slow', 
   		timeout: 2000 
	});
	$("#downArrow").click(function(){
        $(".Information").toggle();
    });
	$("#signin").click(function(){
		$("#SignInBox").dialog({
			modal : true
		});
	});
	$("#signup").click(function(){
		$("#SignUpBox").dialog({
			modal : true
		});
	});
	$(".close").click(function () {
		$("#SignUpBox").dialog();
    });
});	