// JavaScript Document
	$(function(){
		$(".nav dl dd").css("display","none");
		$(".nav dl dt").each(function(){
			$(this).click(function(){
				var state=$(this).next("dd").css("display");
				state=="none"?state="block":state="none";
				$(this).next("dd").css("display",state);
				
			});
		});
		$(".nav dl dd[focus=1]").css("display","block");
	});