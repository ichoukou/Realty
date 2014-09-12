<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.realty.base.action.*,com.realty.base.model.*,java.util.*,java.text.*"%>
<%
String landId1=request.getParameter("landId");
int landId=Integer.parseInt(landId1);
String landallotId1=request.getParameter("landallotId");
int landallotId=Integer.parseInt(landallotId1);

LandallotAction landallotaction=new LandallotAction();
LandAllot landallotlist=landallotaction.findById(landallotId);
int usageId=landallotlist.getLandusageId();
LandAction landaction=new LandAction();
List<LandUsage> usageList=landaction.landusageList();
int i=0; 
%>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加招拍挂</title>
<base href="<%=basePath%>">
<link href="css/manstyle.css" type="text/css" rel="stylesheet">
 <script type="text/javascript" src="js/usage.js"></script>

<style type="text/css">
<!--
.STYLE1 {
	font-size: 22px;
	font-family: "宋体";
}
#Layer1 {
	margin-left: auto;
	margin-right: auto;
	width:663px;
	height:340px;
	z-index:1;
	left: 4px;
	top: 15px;
}
-->
</style>
</head>
<body>
<form id="form1" name="form1" method="post" action="LandServlet?flag=12&landallotId=<%=landallotlist.getLandallotId()%>&landId=<%=landId%>">
<div id="Layer1">
<table width="100%" height="40" border="0" style="border-right:0px ;border-bottom:0px ;">
  <tr>
      <th colspan="2"><div align="center" class="STYLE1"> 招拍挂信息</div></th>
    </tr>
</table>
  <table width="100%" height="300" cellpadding=0 cellspacing=0  >
    <tr>
      <td colspan="2">土地用途：
      <select name="landusageId" size="1" onchange="chg(this)">
       <option value="<%=usageList.get(usageId).getUsageId()%>"><%= usageList.get(usageId).getUsageName()%></option>   
            <%for(int j=0;j<usageList.size();j++){ %>
            <option value="<%=usageList.get(j).getUsageId()%>"><%= usageList.get(j).getUsageName()%></option>
            <% }%>
        </select> 
         <input id="select_else" name="select_else" style="display:none">
        </td>
    </tr>
    <tr>
      <td>土地面积：
        <input name="landArea" type="text" size="20" value="<%=landallotlist.getLandArea()%>"/>m<sup>2</sup></td>
    </tr>
    <tr>
      <td>规划建筑面积：
        <input name="planArea" type="text" size="20" value="<%=landallotlist.getPlanArea()%>"/>m<sup>2</sup></td>
    </tr>
   <tr>
      <td>套数：
        <input name="houseNum" type="text" size="20" value="<%=landallotlist.getHousenum()%>"/></td>
    </tr>
    <tr>
      <td colspan="2">备注：
        <input name="remarks" type="text" size="50" value="<%=landallotlist.getRemarks()%>"/></td>
    </tr>
    <tr>
      <td height="40"><div align="center">
          <input type="submit" name="Submit" value="保存" />
          <input type="reset" name="Submit2" value="重置" />
      </div></td>
    </tr>
  </table>
</div>
</form>
</body>
</html>
