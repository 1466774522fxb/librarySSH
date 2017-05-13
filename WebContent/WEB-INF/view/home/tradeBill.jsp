<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的书单</title>
<style type="text/css">
.lines{

     margin-top: 3px;
    margin-bottom: 3px;
}
</style>
</head>
<body>
<jsp:include page="../../pages/header.jsp"></jsp:include>
<div class="container content-body">
        <div class="col-md-13">
            <div class="section-box">
                <div class="section-nav">
                     		我的书单
                </div>
			<s:iterator value="#request.trade">
               <div class="list-box clearfix">
                    <div class="pull-left list-img">
                            <a href="http://z-innoway.com/index.php?app=web&amp;m=Article&amp;a=detail&amp;id=2509" target="_blank">
                                <img src="public/uploads/${books.bookImg} " alt="中关村创业大街首届手机摄影大赛报名啦！" style="width:150px;">
                            </a>
                        </div>                        
                     <div class="grey14 ">
                                 	 单号：${number} 
                      </div>
                     <hr class="lines">
                         <div class="grey14 ">
                                 	书名：${books.bookName}&nbsp;&nbsp;&nbsp;ISBN:${books.ISBN}&nbsp;&nbsp;&nbsp;作者：${books.author}	&nbsp;&nbsp;&nbsp;出版社：${books.publish}
                        </div>
                       <hr class="lines">
                          <div class="grey14 ">
                                	 借书日期：${borrowDate}     &nbsp;&nbsp;&nbsp;还书日期:${borrowDate} 		 &nbsp;&nbsp;&nbsp;实还日期:${trueDate}
                        </div>
                       <hr class="lines">
                        <div class="grey14 ">
                        
                               	 借阅册数：${count}     &nbsp;&nbsp;&nbsp;押金:${money}￥	&nbsp;&nbsp;&nbsp;状态:<s:if test="state == 0">未归还</s:if><s:else>已归还</s:else>
                        </div>
                        <hr class="lines">
                        <div class="grey14 ">
                           	     联系方式：${sendPhone}     &nbsp;&nbsp;&nbsp;邮寄地址:${sendAddress}	 
                        </div>
                        <s:if test="state == 0">
                          
	                        <a href="javascript:;" onclick="datadel(this,${number})" class="btn btn-success radius">
	                                                                                    还阅图书
	                         </a>
                         </s:if>
                         <s:elseif test="state == 2">
                          <a  href ="javascript:return false;" style="opacity: 0.5" onclick="return false;" class="btn btn-success radius">
	                                                                                   处理中
	                         </a>
                         </s:elseif>
                      <hr class="lines">
                        <div class="grey14 ">
                                 	备注：${reMarks}
                        </div>
                       
               </div>
               </s:iterator>
              ${pageView}
            </div><!--section-box-->
        </div><!--col-md-9-->
    </div>
</div>
<jsp:include page="../../pages/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="public/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="public/layer/2.1/layer.js"></script> 
<script type="text/javascript">
	function datadel(ob,obj){
		 $.post("tradeSubmitReturn","number="+obj,function(data){
			if(data==1){
				layer.msg('提交成功！！',{icon: 0,time:1000});
				$(ob).text("处理中"); 
				$(ob).prop("onclick", "return false");
				$(ob).css( "opacity", 0.5);
			}else{
				layer.msg('提交失败！！',{icon: 0,time:1000});
			}
		}) 
	}

</script>
</html>