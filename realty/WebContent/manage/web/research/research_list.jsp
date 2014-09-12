<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.realty.base.action.WebsiteAction,java.util.List,com.realty.base.model.*" %>
<% 
String reschcategoryId1=request.getParameter("reschcategoryId");
int reschcategoryId=Integer.parseInt(reschcategoryId1);
String title=null;
String add=null;
if(reschcategoryId==0)
	title="市场报告列表";
else 
	title="课题研究列表";


if(reschcategoryId==0)
	add="添加市场报告";
else 
	add="添加课题研究";


WebsiteAction website=new WebsiteAction();
int pageSize=2;
int index=0;
int count=website.researchList(reschcategoryId).size();

if(count%pageSize==0&&count!=0)
 index=count/pageSize;
else {
	index=count/pageSize+1;
	}
String pageNos=request.getParameter("pageNo");	
if(pageNos==null){
	pageNos="1";
}
if(pageNos==""){
	pageNos="1";
}
int pageNo=Integer.parseInt(pageNos);
if(pageNo<1){
	pageNo=1;
	}else if(pageNo>index){
		pageNo=index;
	}
List<Research> pagelist=website.researchList(pageNo, pageSize,reschcategoryId);
%>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>住宅列表</title>
<base href="<%=basePath%>">
<link rel="stylesheet" rev="stylesheet" href="./css/web.css" type="text/css" media="all" />
</head>
<SCRIPT language=JavaScript>

function insert()
{
	window.open('manage/web/research/research_add.jsp?reschcategoryId=<%=reschcategoryId%>','middleFrame','top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
}
function search()
{
	document.form.action="WebsitemServlet?flag=12";
	document.form.submit();
}
function passpageNo(){
	var gopageNo = document.getElementById("gopageNo").value; 
	document.form.action="manage/web/research/research_list.jsp?reschcategoryId=<%=reschcategoryId%>&pageNo="+gopageNo;
	document.form.submit();
}
</SCRIPT>

<body>
<form name="form" id="form" method="post" action="">
<table id="mainpage" width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="62" background="images/manage/nav04.gif">
		   <table width="89%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="89">&nbsp;</td>
			<td width="984">按标题：<input name="searchtitle" type="text" size="25"/>
			<img src="images/manage/search.gif" width="20" height="18" />
			  <input name="button1" type="button" class="right-button02" value="查 询" onClick="search()"/>
			  
			 </td>
			 <td width="175" align="left">
			   <input name="button2" type="button" class="right-button07" value="<%=add%>" onClick="insert()"/>
			 </td>	
		  </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          	 <tr>
               <td height="30">&nbsp;</td>
          	 </tr>
              <tr>
                <td class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
					                  
					                  <tr>
                    <td height="35" colspan="6" class="tablestyle_title"><%=title%></td>
                    </tr>
                  <tr>
				    <td width="70%" height="30" align="center" bgcolor="#EEEEEE">标题</td>
                    <td width="30%" align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
                    <% if(pagelist!=null) 
                	  for(int i=0;i<pagelist.size();i++){ %> 
                  <tr align="center">
				    <td height="30" bgcolor="#FFFFFF"> <a href="manage/web/research/research_detail.jsp?reschcategoryId=<%=reschcategoryId%>&research_id=<%=pagelist.get(i).getReschId()%>" ><%=pagelist.get(i).getTitle()%></a></td>
                    <td bgcolor="#FFFFFF"><a href="manage/web/research/research_update.jsp?reschcategoryId=<%=reschcategoryId%>&research_id=<%=pagelist.get(i).getReschId()%>" >修改 </a>   <a href="WebsitemServlet?flag=11&reschcategoryId=<%=reschcategoryId%>&researchId=<%=pagelist.get(i).getReschId()%>">删除</a></td>
                  </tr>
                  <%} %>
                </table></td>
              </tr>
            </table>
            </td>
        </tr>
      </table>
      
      <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="images/manage/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="50%">共 <span class="right-text09"><%=index%></span> 页 | 第 <span class="right-text09"><%=pageNo%></span> 页</td>
                <td width="48%" align="right">[<a href="manage/web/research/research_list.jsp?reschcategoryId=<%=reschcategoryId %>&pageNo=1" class="right-font08">首页</a> | <a href="manage/web/research/research_list.jsp?reschcategoryId=<%=reschcategoryId %>&pageNo=<%=pageNo-1%>" class="right-font08">上一页</a> | <a href="manage/web/research/research_list.jsp?reschcategoryId=<%=reschcategoryId %>&pageNo=<%=pageNo+1%>" class="right-font08">下一页</a> | <a href="manage/web/research/research_list.jsp?reschcategoryId=<%=reschcategoryId %>&pageNo=<%=index%>" class="right-font08">末页</a>] 转至：</td>
                <td width="2%"><table width="29" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="1%"><input id="gopageNo" type="text" class="textfield" size="1" /></td>
                      <td width="87%"><input name="pagego" type="button" class="right-button06" onclick="passpageNo()" />
                      </td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
      </table>
   </td>
  </tr>
</table>
</form>

</body>

</html>