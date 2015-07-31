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
