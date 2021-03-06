<%@page import="jums.UserDataBeans"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="jums.JumsHelper" %>
<%
    HttpSession hs = request.getSession();
    UserDataBeans udb = new UserDataBeans();
    if(hs.getAttribute("udb")!=null){
         udb=(UserDataBeans)hs.getAttribute("udb");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録画面</title>
    </head>
    <body>
   <!--5.insertconfirmからinsertへ再度入力する際に、このままではフォームに値が保持されていない。
   適切な処理を施して、再度入力の際にはフォームに値を保持したままにさせなさい-->
        <form action="insertconfirm" method="POST">
        名前: <input type="text" name="name" value="<%=udb.getName()%>">
 
        <br><br>

        生年月日:　
        <select name="year">
            <option value="0">----</option>
            <%
            for(int i=1950; i<=2010; i++){ %>
            <option value="<%=i%>"<%if(i==udb.getYear()){out.print("selected");}%>><%=i%></option>
            <% } %>
        </select>年
        <select name="month">
            <option value="">--</option>
            <%
            for(int i = 1; i<=12; i++){ %>
            <option value="<%=i%>"<%if(i==udb.getMonth()){out.print("selected");}%>><%=i%></option>
            <% } %>
        </select>月
        <select name="day">
            <option value="">--</option>
            <%
            for(int i = 1; i<=31; i++){ %>
            <option value="<%=i%>"<%if(i==udb.getDay()){out.print("selected");}%>><%=i%></option>
            <% } %>
        </select>日
        <br><br>

        種別:
        <br>
        <input type="radio" name="type" value="1" <% if(udb.getType().equals("1")){out.print("checked");}%>>エンジニア<br>
        <input type="radio" name="type" value="2"<% if(udb.getType().equals("2")){out.print("checked");}%>>営業<br>
        <input type="radio" name="type" value="3"<% if(udb.getType().equals("3")){out.print("checked");}%>>その他<br>
        <br>

        電話番号:
        <input type="text" name="tell" value="<%=udb.getTell()%>">
        <br><br>

        自己紹介文
        <br>
        <textarea name="comment" rows=10 cols=50 style="resize:none" wrap="hard"><%=udb.getComment()%></textarea><br><br>
        
        <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
        <input type="submit" name="btnSubmit" value="確認画面へ">
    </form>
        <br>
       <%//課題1.トップへのリンク表示%>
        <%=JumsHelper.getInstance().home()%>
    </body>
</html>
