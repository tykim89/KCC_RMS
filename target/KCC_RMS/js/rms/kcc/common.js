/* Contact US */

function SwitchMenu(obj){
  if(document.getElementById){
  var el = document.getElementById(obj);
  var ar = document.getElementById("maindiv").getElementsByTagName("span");
    if(el.style.display != "block"){
      for (var i=0; i<ar.length; i++){
        if (ar[i].className=="submenu")
        ar[i].style.display = "none";
      }
      el.style.display = "block";
    }else{
      el.style.display = "none";
    }
  }
}

//시스템통함
function change01(a){
    document.all.btn01.style.display="none";
    document.all.btn02.style.display="none";
    b = eval("document.all." + a)
    b.style.display="inline";
}
function change02(a){
    document.all.btn03.style.display="none";
    document.all.btn04.style.display="none";
    b = eval("document.all." + a)
    b.style.display="inline";
}
function change03(a){
    document.all.btn05.style.display="none";
    document.all.btn06.style.display="none";
    b = eval("document.all." + a)
    b.style.display="inline";
}
function change04(a){
    document.all.btn07.style.display="none";
    document.all.btn08.style.display="none";
    b = eval("document.all." + a)
    b.style.display="inline";
}
function change05(a){
    document.all.btn09.style.display="none";
    document.all.btn10.style.display="none";
    b = eval("document.all." + a)
    b.style.display="inline";
}
//아웃소싱
function change11(a){
    document.all.btn11.style.display="none";
    document.all.btn12.style.display="none";
    b = eval("document.all." + a)
    b.style.display="inline";
}
//보안
function change21(a){
    document.all.btn21.style.display="none";
    document.all.btn22.style.display="none";
    b = eval("document.all." + a)
    b.style.display="inline";
}
//방송
function change31(a){
    document.all.btn31.style.display="none";
    document.all.btn32.style.display="none";
    b = eval("document.all." + a)
    b.style.display="inline";
}
//서버
function change41(a){
    document.all.btn41.style.display="none";
    document.all.btn42.style.display="none";
    b = eval("document.all." + a)
    b.style.display="inline";
}
function change42(a){
    document.all.btn43.style.display="none";
    document.all.btn44.style.display="none";
    b = eval("document.all." + a)
    b.style.display="inline";
}
//스토리지
function change51(a){
    document.all.btn51.style.display="none";
    document.all.btn52.style.display="none";
    b = eval("document.all." + a)
    b.style.display="inline";
}
//네트워크
function change61(a){
    document.all.btn61.style.display="none";
    document.all.btn62.style.display="none";
    b = eval("document.all." + a)
    b.style.display="inline";
}
//팩키지솔루션
function change71(a){
    document.all.btn71.style.display="none";
    document.all.btn72.style.display="none";
    b = eval("document.all." + a)
    b.style.display="inline";
}
function change72(a){
    document.all.btn73.style.display="none";
    document.all.btn74.style.display="none";
    b = eval("document.all." + a)
    b.style.display="inline";
}