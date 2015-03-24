function MS_Flash(fid,src,wid,hei,fvs,wmd) { 
  this.fPrint = ''; 
  this.Id = document.getElementById(fid); 
  this.Src = src; 
  this.Width = wid; 
  this.Height = hei; 
  this.FlashVars = ( typeof fvs != 'undefined')? fvs :''; 
  this.Wmod = ( typeof wmd != 'undefined')? wmd :''; 
  if(isObject(Id)) { 
    fPrint = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="https://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0"'; 
    fPrint += ' width="'+Width+'"'; 
    fPrint += ' height="'+Height+'">'; 
    fPrint += '<param name="movie" value="'+Src+'">'; 
    fPrint += '<param name="quality" value="high">'; 
    fPrint += (FlashVars != null) ? '<param name="FlashVars" value="'+FlashVars+'">' : ''; 
    fPrint += (Wmod != null) ? '<param name="wmode" value="'+Wmod+'">' : ''; 
    fPrint += '<embed'; 
    fPrint += fPrint + ' src="'+Src+'"'; 
    fPrint += (FlashVars != null) ? ' FlashVars="'+FlashVars+'"' : ''; 
    fPrint += (Wmod != null) ? ' wmode="'+Wmod+'"' : ''; 
    fPrint += ' quality="high"'; 
    fPrint += ' pluginspage="https://www.macromedia.com/go/getflashplayer"'; 
    fPrint += ' type="application/x-shockwave-flash"'; 
    fPrint += ' width="'+Width+'"'; 
    fPrint += ' height="'+Height+'"'; 
    fPrint += '></embed>'; 
    fPrint += '</object>'; 
    Id.innerHTML = fPrint; 
  } 
} 

function isObject(a) {
    return (a && typeof a == 'object');
}

function MS_Embed() 
{ 
  var obj = new String; 
  var parameter = new String; 
  var embed = new String; 
  var html = new String; 
  var allParameter = new String; 
  var clsid = new String; 
  var codebase = new String; 
  var pluginspace = new String; 
  var embedType = new String; 
  var src = new String; 
  var width = new String; 
  var height = new String; 

    
  this.init = function( s ,w , h, getType ) { 
      getType = (getType != undefined)? getType :'flash'; 
      if ( getType == "flash") 
      { 

        clsid = "D27CDB6E-AE6D-11cf-96B8-444553540000";        
        codebase = "https://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0"; 
        pluginspage = "https://www.macromedia.com/go/getflashplayer"; 
        embedType = "application/x-shockwave-flash"; 
      } 
      /* type �߰� 
      else if ( ) 
      { 
      } 
      */ 
            
      parameter += "<param name='movie' value='"+ s + "'>\n";  
      parameter += "<param name='quality' value='high'>\n";   
	  parameter += "<param name='allowScriptAccess' value='always'>\n";
      
      src = s; 
      width = w; 
      height = h; 
  } 
  
  this.parameter = function( parm , value ) {      
      parameter += "<param name='"+parm +"' value='"+ value + "'>\n";        
      allParameter += " "+parm + "='"+ value+"'"; 
  }  
  
  this.show = function() { 
      if ( clsid ) 
      { 
        obj = "<object classid=\"clsid:"+ clsid +"\" codebase=\""+ codebase +"\" width='"+ width +"' height='"+ height +"'>\n"; 
      } 
      
      embed = "<embed src='" + src + "' allowScriptAccess='always' pluginspage='"+ pluginspage + "' type='"+ embedType + "' width='"+ width + "' height='"+ height +"'"+ allParameter +" ></embed>\n"; 
      
      if ( obj ) 
      { 
        embed += "</object>\n"; 
      } 
      
      html = obj + parameter + embed; 
      
      document.write( html );  
  } 
  
} 

