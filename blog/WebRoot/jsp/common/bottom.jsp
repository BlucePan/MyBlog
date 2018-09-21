<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 返回顶部 -->
<a class="to-top" id="toTop" title="点击返回顶部" ></a>
<footer>
  <div class="dandelion">
  <span class="smalldan"></span>
  <span class="bigdan"></span>
  </div>
  <p>博客已稳定运行   <span id="sitetime" style="color:#f00">siteTime()</span>  Design by BlucePan <a href="http://www.miitbeian.gov.cn/" target="_blank" style="color:#848589">版权所有  浙ICP备18037226号</a></p>
  <p class="dh"> <a href="${blog}/" target="_blank">首页</a>&nbsp;|&nbsp;<a href="${blog}/jottings.html" target="_blank">闲谈随笔</a>&nbsp;|&nbsp;<a href="${blog}/gustbook.html" target="_blank">给我留言</a>&nbsp;|&nbsp;<a href="#" target="_blank">免费声明</a>&nbsp;|&nbsp;<a href="https://tongji.baidu.com/web/welcome/ico?s=dd28fbe52b1daa3bdea6b4893748ec61" target="_blank">百度统计分析</a></p>
  <div class="beian">
   <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo">
  	  <img src="${blog}/img/ga.png" alt="">
      <span>浙公网安备 33010418037226号</span>
   </a>
  </div>
</footer>
<!-- 百度统计代码 -->
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?dd28fbe52b1daa3bdea6b4893748ec61";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<script src="${blog}/js/silder.js"></script>
<!-- 鼠标点击特效 -->
<script type="text/javascript" src="${blog}/js/public.js"></script>
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
<script type="text/javascript">   
 /* 返回顶部插件 */
$(function(){
        //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
        $(function () {
            $(window).scroll(function(){
                if ($(window).scrollTop()>200){
                    $("#toTop").fadeIn(1500);
                }
                else
                {
                    $("#toTop").fadeOut(1500);
                }
            });
            //当点击跳转链接后，回到页面顶部位置
            $("#toTop").click(function(){
                $('body,html').animate({scrollTop:0},1000);
                return false;
            });
        });
    });
 /* 返回顶部插件 end */
 
 //计时器
function siteTime(){
window.setTimeout("siteTime()", 1000);
var seconds = 1000
var minutes = seconds * 60
var hours = minutes * 60
var days = hours * 24
var years = days * 365
var today = new Date()
var todayYear = today.getFullYear()
var todayMonth = today.getMonth()
var todayDate = today.getDate()
var todayHour = today.getHours()
var todayMinute = today.getMinutes()
var todaySecond = today.getSeconds()
/* Date.UTC() -- 返回date对象距世界标准时间(UTC)1970年1月1日午夜之间的毫秒数(时间戳)
year - 作为date对象的年份，为4位年份值
month - 0-11之间的整数，做为date对象的月份
day - 1-31之间的整数，做为date对象的天数
hours - 0(午夜24点)-23之间的整数，做为date对象的小时数
minutes - 0-59之间的整数，做为date对象的分钟数
seconds - 0-59之间的整数，做为date对象的秒数
microseconds - 0-999之间的整数，做为date对象的毫秒数 */
var t1 = Date.UTC(2018,8,9,0,0,0)
var t2 = Date.UTC(todayYear,todayMonth,todayDate,todayHour,todayMinute,todaySecond)
var diff = t2-t1
var diffYears = Math.floor(diff/years)
var diffDays = Math.floor((diff/days)-diffYears*365)
var diffHours = Math.floor((diff-(diffYears*365+diffDays)*days)/hours)
var diffMinutes = Math.floor((diff-(diffYears*365+diffDays)*days-diffHours*hours)/minutes)
var diffSeconds = Math.floor((diff-(diffYears*365+diffDays)*days-diffHours*hours-diffMinutes*minutes)/seconds)
document.getElementById("sitetime").innerHTML=+diffDays+" 天 "+diffHours+" 小时 "+diffMinutes+" 分钟 "+diffSeconds+" 秒"
}
siteTime()
</script>