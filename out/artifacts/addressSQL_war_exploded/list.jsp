<%@ page import="java.util.List" %>
<%@ page import="entity.Address" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>>
<html>
<head>
  <title>list</title>
  <link rel="stylesheet" type="text/css" href="./CSS/list.css">
  <script>
    window.onload = function(){
      var oTxt = document.getElementById("update-text");
      var formMethod = "list";
      var oCheckbox = document.getElementsByName("cb-id");
      document.getElementById("update").onclick = function(){
        oTxt.style.display = "block";
        formMethod = "update";
      };
      document.getElementById("add").onclick = function(){
        oTxt.style.display = "block";
        formMethod = "add";
      };
      document.getElementById("delete").onclick = function(){
        document.forms.list.action = "addressServlet?method=delete";
        document.forms.list.submit();
      };
      document.getElementById("update-ok").onclick = function(){
        oTxt.style.display = "none";
        document.forms.list.action = "addressServlet?method="+formMethod;
        document.forms.list.submit();
      }
      document.getElementById("all").onclick = function () {
        for(var i=0;i<oCheckbox.length;i++){
          oCheckbox[i].checked = true;
        }
      }
      document.getElementById("opposite").onclick = function () {
        for(var i=0;i<oCheckbox.length;i++){
          if(oCheckbox[i].checked)  oCheckbox[i].checked = false;
          else oCheckbox[i].checked = true;
        }
      }
      document.getElementById("cancel").onclick = function () {
        for(var i=0;i<oCheckbox.length;i++){
          oCheckbox[i].checked = false;
        }
      }
    }
  </script>
</head>
<body>
  <form  id="list" action="addressServlet?method=delete"  method="post">
    <table border="1">
      <tr class="tr-title">
        <td>ID</td>
        <td>NAME</td>
        <td>ZIP</td>
      </tr>
    <%--<%--%>
      <%--List<Address> list = (List<Address>) request.getAttribute("list");--%>
      <%--for(Address a:list){--%>
        <%--request.setAttribute("a",a);--%>
    <%--%>--%>

      <c:forEach var="a" items="${list}">
        <tr>
          <td class="td-id">
            <input type="checkbox" name="cb-id" value="${a.id}"/>
              ${a.id}
          </td>
          <td>${a.name}</td>
          <td>${a.zip}</td></tr>
      </c:forEach>
    <%--<% } %>--%>
    </table>
    <div>
      <input type="button" value="添加" class="options" id="add"/> <br/>
      <input type="button" value="删除" class="options" id="delete"/> <br/>
      <input type="button" value="更新" class="options" id="update"/> <br/>
      <input type="button" value="全选" class="options" id="all"/> <br/>
      <input type="button" value="反选" class="options" id="opposite"/> <br/>
      <input type="button" value="取消" class="options" id="cancel"/> <br/>

    </div>
    <div id="update-text" style="display: none">
      Name:<input type="text" name="name" class="text-right"/> <br/>
      Zip:<input type="text" name="zip" class="text-right"/><br/>
      <input type="button" class="options" value="确认" id="update-ok"/>
    </div>
  </form>
</body>
</html>
