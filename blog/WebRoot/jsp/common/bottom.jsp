<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<footer>
  <div class="dandelion">
  <span class="smalldan"></span>
  <span class="bigdan"></span>
  </div>
  <p>Design by DanceSmile <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备11002373号-1</a> <a href="/">网站统计</a></p>
</footer>
<script src="${blog}/js/silder.js"></script>

<!-- 灰色背景特效 -->
<%-- <script type="text/javascript" src="${blog}/js/particle.js"></script> --%>
 <!-- 按需加载背景 -->
  <!-- 识别手机或电脑的js开始 -->  
<!--   <script type="text/javascript">   
  (function(){  
    var res = GetRequest();  
    var par = res['index'];  
    if(par!='gfan'){  
      var ua=navigator.userAgent.toLowerCase();  
      var contains=function (a, b){  
          if(a.indexOf(b)!=-1){return true;}  
      };   
   /*    if((contains(ua,"android") && contains(ua,"mobile"))||(contains(ua,"android") && contains(ua,"mozilla"))||(contains(ua,"android") && contains(ua,"opera"))||contains(ua,"ucweb7")||contains(ua,"iphone")){
        return false;
      } else {
        $.getScript("${blog}/js/particle.js");
      } */
      $.getScript("${blog}/js/particle.js");
    }  
  })();  
  function GetRequest() {  
    var url = location.search;
    var theRequest = new Object();  
    if (url.indexOf("?") != -1) {  
      var str = url.substr(1);  
      strs = str.split("&");  
      for(var i = 0; i < strs.length; i ++) {  
        theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);  
      }  
    }  
    return theRequest;  
  }  
  </script>   -->
  <!-- 识别手机或电脑的js结束 --> 
  <!-- 红色背景特效 --> 
 <script color="255,0,0" opacity='0.7' zIndex="-2" count="150"   src="${blog}/js/canvas-nest.min.js"></script>
