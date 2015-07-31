<%@ page import="java.util.List" %>
<%@ page import="entity.Address" %>
<%--
  Created by IntelliJ IDEA.
  User: zhangyu
  Date: 2015/7/23
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <%
      List<Address> list = (List<Address>) request.getAttribute("list");
      for(Address a:list){
    %>
    <tr>
      <%-- http://localhost:8080/servelt?method=delete&cb-id=1 --%>
      <td class="td-id">
        <input type="checkbox" name="cb-id" value="<%=a.getId() %>"/>
        <%=a.getId() %>
      </td>
      <td><%=a.getName() %></td>
      <td><%=a.getZip() %></td></tr>
    <% } %>
    </table>
    <div>
      <%--<a href="add.html"><input type="button" class="options" value="添加"/> </a> <br/>--%>
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