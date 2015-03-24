// BROWSERS CHECK
is=[];
is.dom  = document.getElementById?1:0;
is.ua   = navigator.userAgent.toLowerCase();
is.ie   = is.ua.match(/msie/)||0;
is.ie6  = is.ua.match(/msie 6/)||0;
is.ie5  = is.ua.match(/msie 5/)||0;
is.ie50 = is.ua.match(/msie 5\.0/)||0;
is.mac  = is.ua.match(/mac/)||0;

openSELECT=function(n,c){
	if (!c) var c="";
	if (is.dom&&!is.ie&&!is.mac) document.write( '<span style="position:relative"><img style="border:1px solid #d3d3d3;background-color:#f7f7f7;" src="none.gif" width="203" height="17" border="0" /><select style="position: absolute;left:0px;top:-9px;width:205px;height:18px;clip:rect(2,203,17,2);" name="'+ n +'" '+c+' class="rSelect">')
	else if (is.ie&&!is.mac) document.write( '<span style="position:relative"><img style="border:1px solid #d3d3d3;background-color:#f7f7f7;" src="none.gif" width="203" height="17" border="0" /><select style="position: absolute;left:0px; top:0px;width:205px;height:18px;clip:rect(2,203,17,2);" name="'+ n +'" '+c+' class="rSelect">' )
	else document.write( '<select style="border:0px;height:18px;" name="'+ n +'" '+c+' class="rSelect">' )
}

	openSELECT2=function(n,c,w,h){
	if (!c) var c="";
	if (is.dom&&!is.ie&&!is.mac) document.write( '<span style="position:relative"><img style="border:1px solid #d3d3d3;background-color:#f7f7f7;" src="none.gif" width=136 height=17 border="0" /><select style="position: absolute;left:0px;top:-9px;width:138px;height:17px;clip:rect(2,136,18,2);" name="'+ n +'" '+c+' class="rSelect">')
	else if (is.ie&&!is.mac) document.write( '<span style="position:relative"><img style="border:1px solid #d3d3d3;background-color:#f7f7f7;" src="none.gif" width=136 height=17 border="0" /><select style="position: absolute;left:0px; top:0px;width:138px;height:17px;clip:rect(2,136,18,2);" name="'+ n +'" '+c+' class="rSelect">' )
	else document.write( '<select style="border:0px;height:17px;" name="'+ n +'" '+c+' class="rSelect">' )
}

closeSELECT=function(){
	if (is.dom&!is.ie) document.write( '</select></span>')
	else if (is.ie) document.write( '</select></span>' )
	else document.write( '</select>' )
}



goSub=function(url){
	if(url!=""){
		location.href=url;
	}
}


goPG=function(url){
	//alert(url);
	if(url!=""){
		newWin = window.open(url); 
	}
}