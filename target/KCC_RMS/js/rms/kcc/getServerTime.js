  var xmlhttp;
  var serverTime;
  function loadXMLDoc(url) {
    xmlhttp=null;
    if (window.XMLHttpRequest)
      {// code for all new browsers
        xmlhttp=new XMLHttpRequest();
      }
    else if (window.ActiveXObject)
      {// code for IE5 and IE6
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    if (xmlhttp!=null)
    {
      xmlhttp.onreadystatechange=state_Change;
      xmlhttp.open("HEAD",url,true);
      xmlhttp.send(null);
    }
    else
    {
      alert("Your browser does not support XMLHTTP.");
    }
  }

  function state_Change()
  {
    if (xmlhttp.readyState==4)
    {
      if (xmlhttp.status==200)
      {
        var time = xmlhttp.getResponseHeader("Date");
        var time_fix = new Date(time);
        serverTime = 
        {
          year: time_fix.getUTCFullYear(),
          month: time_fix.getUTCMonth(),
          date: time_fix.getUTCDate(),
          hour: time_fix.getUTCHours(),
          min: time_fix.getUTCMinutes(),
          sec: time_fix.getUTCSeconds(),
          day: time_fix.getUTCDay()
        };
        runServerTime();
        }
      else
      {
        alert("Error: " + xmlhttp.statusText);
      }
    }
  }
  /* Definitions */
  monthdays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  day = ['일', '월', '화', '수', '목', '금', '토'];

  function runServerTime()
  {
    serverTime.hour += 9;
    if(serverTime.hour > 23)
    {
      serverTime.hour = 0;
      ++serverTime.date;
      ++serverTime.day;
    }
    if(serverTime.day > 6)
    {
      serverTime.day = 0;
    }
    if(serverTime.date > monthdays[serverTime.month])
    {
      serverTime.date = 1;
      ++serverTime.month;
    }
    if(serverTime.month > 12)
    {
      serverTime.month = 1;
      ++serverTime.year;
      if(serverTime.year%400 != 0 || serverTime.year%4 != 0 && serverTime.year%100 == 0 ) { monthdays[1] = 28; }
    }
    else
    {
      document.getElementById("clock").innerHTML = serverTime.year + "년 " + (serverTime.month + 1) + "월 " + serverTime.date + "일 " + day[serverTime.day] + "요일 " + double_figure(serverTime.hour) + "시 " + double_figure(serverTime.min) + "분 " + double_figure(serverTime.sec) + "초" ;
      setInterval(timeUpdate, 1000);
    }
  }

  function timeUpdate()
  {
    if(serverTime.year%400 == 0 || serverTime.year%4 == 0 && serverTime.year%100 != 0 ) { monthdays[1] = 29; }
    ++serverTime.sec;
    if(serverTime.sec > 59)
    {
      serverTime.sec = 0;
      ++serverTime.min;
    }
    if(serverTime.min > 59)
    {
      serverTime.min = 0;
      ++serverTime.hour;
    }
    if(serverTime.hour > 23)
    {
      serverTime.hour = 0;
      ++serverTime.date;
      ++serverTime.day;
    }
    if(serverTime.day > 6)
    {
      serverTime.day = 0;
    }
    if(serverTime.date > monthdays[serverTime.month])
    {
      serverTime.date = 1;
      ++serverTime.month;
    }
    if(serverTime.month > 12)
    {
      serverTime.month = 1;
      ++serverTime.year;
      if(serverTime.year%400 != 0 || serverTime.year%4 != 0 && serverTime.year%100 == 0 ) { monthdays[1] = 28; }
    }
	else if (serverTime.month + 1 >= 11 && serverTime.date >=19 && double_figure(serverTime.hour) >= 01 && double_figure(serverTime.min) >= 13 && double_figure(serverTime.sec) >= 00 )
	{
		clearInterval();
		document.getElementById("layer_time").style.display='none';
		document.getElementById("layer_input").style.display='block';
	}
    else
    {
      document.getElementById("clock").innerHTML = serverTime.year + "년 " + (serverTime.month + 1) + "월 " + serverTime.date + "일 " + day[serverTime.day] + "요일 " + double_figure(serverTime.hour) + "시 " + double_figure(serverTime.min) + "분 " + double_figure(serverTime.sec) + "초" ;
    }
  }

  function double_figure(t)
  {
    if (t<10)
      {
        t="0" + t;
      }
    return t;
  }
  var domain_name = document.domain;
  loadXMLDoc('https://' + domain_name + '/?' + (new Date()).getTime());

/*사용할 페이지에 아래 span태그를 삽입하면 됨 */
/*<span id="clock"></span>*/