<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/back-common.jsp"%>
<%@ include file="/pages/common/taglib.jsp"%>
<%@ taglib uri="/WEB-INF/tld/auth.tld" prefix="auth" %>
<html>
<head>
<title>创建首页图片</title>
<script src="${pageContext.request.contextPath}/common/js/jquery.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/common/js/jquery.validate.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/common/css/indexJpgForm.css" />
<script language="javascript">
$.validator.setDefaults({
});
 $(document).ready(function() {
	$("#indexJpgForm").validate({
		rules: {
			alt:  "required",
			title: "required",
			stitle: "required",
			link: "required",
			titleLink: "required",
			file:  {
				required: "#imgName:blank"
			}
		},
		messages: {
			alt: "说明文字不能少于5个字符",
			title:"请输入说明文字",
			stitle:"请输入说明文字",
			link:"请输入说明文字",
			titleLink:"请输入说明文字",
			file:"上传文件不能为空"
		}
		});
    $("#col1 tr").each(function(i){
	      if(i>0){
	         if(i%2 == 0){
	             $(this).addClass('even');
	         }else{    
	              $(this).addClass('odd'); 
	         }   
	    }
	     });   
	         $("#col1 th").addClass('sortable');
		
	});

</script>

</head>
<body class="bodymargin">
<form action="${pageContext.request.contextPath}/admin/indexjpg/save${applicationScope.WEB_SUFFIX}"  method="post" id="indexJpgForm" enctype="multipart/form-data" >
  <input id="id" name="id" value="${index.id}" type="hidden">
  <table class="${tableclass}" style="width: 100%">
    <thead>
    	<tr><td><a href="<ls:url address='/admin/index'/>" target="_parent">首页</a> &raquo; 商城管理  &raquo; <a href="${pageContext.request.contextPath}/admin/indexjpg/query${applicationScope.WEB_SUFFIX}">首页广告图片管理</a> &raquo; 创建首页图片</td></tr>
    </thead>
    </table>
  <table class="${tableclass}" id="col1" style="width:100%">
  <thead>
    <tr>
      <th colspan="2"><div align="center">创建首页图片</div></th>
    </tr>
    </thead>
    <tr style="display: none;">
      <td width="30%"><div align="right">链接地址<font color="#ff0000">*</font></div></td>
      <td width="70%">
      <p>
          <input type="text" name="href" id="href" size="30" value="${index.href}"> </p>
      </td>
    </tr>
    <tr>
      <td width="30%"><div align="right">说明文字<font color="#ff0000">*</font></div></td>
      <td width="70%">
      <p>
      <input type="text" name="alt" id="alt" size="30" value="${index.alt}">
      </p>
      </td>
    </tr>
     <tr>
      <td width="30%"><div align="right">标题<font color="#ff0000">*</font></div></td>
      <td width="70%">
      <p>
      <input type="text" name="title" id="title" size="30" value="${index.title}">
      </p>
      </td>
    </tr>   
    <tr>
      <td width="30%"><div align="right">小标题<font color="#ff0000">*</font></div></td>
      <td width="70%">
      <p>
      <input type="text" name="stitle" id="stitle" size="30" value="${index.stitle}">
      </p>
      </td>
    </tr>   
    <tr>
      <td width="30%"><div align="right">图片链接地址<font color="#ff0000">*</font></div></td>
      <td width="70%">
      <p>
      <input type="text" name="link" id="link" size="30" value="${index.link}">
      </p>
      </td>
    </tr>  
    <tr>
      <td width="30%"><div align="right">标题链接地址<font color="#ff0000">*</font></div></td>
      <td width="70%">
      <p>
      <input type="text" name="titleLink" id="titleLink" size="30" value="${index.titleLink}">
      </p>
      </td>
    </tr> 
	<tr>
      <td>
      	<div align="right">上传图片，不能大于3M，大小为530*290<font color="#ff0000">*</font></div></td>
      <td>
      	<p>
      	<input type="file" name="file" id="file" size="30"/>
      	</p>
      	<input type="hidden" name="imgName" id="imgName" size="30" value="${index.img}"/>
      </td>
    </tr>
    <tr>
    <td ><div align="right">原有图片</div></td>
      <td>
      <c:if test="${index.img!=null}">
      	<a href="${pageContext.request.contextPath}/photoserver/photo/${index.img}" target="_blank">
      	<img src="${pageContext.request.contextPath}/photoserver/photo/${index.img}" height="145" width="265"/></a>
      	</c:if>
      </td>
    </tr>
    <tr>
      <td colspan="2">
                              <div align="center">
                        <auth:auth ifAnyGranted="F_OPERATOR">
                            <input type="submit" value="提交" />
                         </auth:auth>
                            <input type="reset" value="重置" />
                            <input type="button" value="返回"
                                onclick="window.location='${pageContext.request.contextPath}/admin/indexjpg/query${applicationScope.WEB_SUFFIX}'" />
                        </div>
      
      </td>
    </tr>
  </table>
</form>
		</body>
</html>