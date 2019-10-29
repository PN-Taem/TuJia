$(function() {
				$("ul li").hover(function() {
						$(this).children("a,p").css("color", "#ED6D01");
					}, function() {
						$(this).children("a,p").css("color", "white");
					}
				);
				
				$("#deng a").hover(function() {
						$(this).css("color", "black");
					}, function() {
						$(this).css("color", "white");
					}

				);
				
				var i=true;
				var o=0;//上一个li下标
				var t=0;
				var ii=142;
				$("ul li").mouseenter(function() {
					t=$(this).index();//当前li下标
					var count=$("ul li:last-of-type").index()+1;
					var max=ii*count;
					$(this).css("background","url(img/tu"+t+".png) no-repeat");
					if(t==o){
						return;
					}
					if(i){
					if(t>o){
						ii=ii*(t-o);
						if(ii<=max){
							id=ii;
							$("#dong").animate({ left:"+="+ii+"px" }, 500);
						}
					}else{
						ii=ii*(o-t);
						if(ii>=142){
							id=ii;
							$("#dong").animate({ left:"-="+ii+"px" }, 500);
						}
					}
					
					i=false;
					}
					});
					$("ul li").mouseleave(function(){
						i=true;
						ii=142;
						o=t;
						var li=$(this).index();
						$(this).css("background","url(img/bai"+li+".png) no-repeat");
					})
					
				

			});