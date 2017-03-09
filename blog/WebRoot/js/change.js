// JavaScript Document

$(zhu);

function zhu(){
    meun();option();company();
}

function meun(){
    var hm=$(".meun h2");
	hm.on("click",function(){
	    $(this).next().slideToggle(300);
	})
	//$(".meun ul").eq(0).show();
}

$(function(){
    var p=$(".sel_wrap").find("option");
    p.each(function(i) {
            if (p[i].selected == true) {
            	k = p[i].innerHTML;
                v = p[i].value;
                $(this).parents(".sel_wrap").find("label").text(k)
            }
    })
})

function option(){
	$("body").on("change",".sel_wrap",function(){
		var o;
        var opt = $(this).find('option');
        opt.each(function(i) {
            if (opt[i].selected == true) {
                o = opt[i].innerHTML;
            }
        })
        $(this).find('label').html(o);
    }).trigger('change');	
}


function company(){
   $(".company li").each(function() {
         var ge=$(this).find("ul").length;
		 if(ge==0){
		     $(this).addClass("nobu");	
		 }
		 else{
		     $(this).removeClass("nobu");
//			 $(this).find("a").attr("href","javascript:;"); 	 
		 }
   }); 	
//  $("body").on("click",".company li a",function(){
//	     var liul=$(this).next("ul");
//		 $(this).addClass("thisclass").parents("li").siblings().find("a").removeClass("thisclass");
//	     if(liul.is(":hidden")){
//			liul.slideDown(200); 
//		 }
//		 else{
//		    liul.slideUp(200);
//		 }
		 
//   })
}