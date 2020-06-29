$(function() {
	$(window).scroll(function() {
		var scrollTop = $(window).scrollTop();
		if (scrollTop > 150) {
			$("#nav-menu").css({position:"fixed", left: "0", right:"0", top: "43px", zIndex: "97"})
		} else {
			$("#nav-menu").css("position", "static");
		}
	});
	
	$("#nav-menu li.dropdown a").click(function(event) {
		location.href = $(this).attr("href");
		event.isImmediatePropagationStopped();
	});
})
