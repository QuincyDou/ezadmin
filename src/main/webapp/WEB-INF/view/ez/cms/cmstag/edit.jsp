<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>标签表编辑</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">
		<input type="hidden" name="cmsTagId" value="${cmstag.cmsTagId}"/>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>名称:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsName" value="${cmstag.cmsName}"  required  lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
			</div>
		</div>
		<%--<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>操作时间:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsCreationTime" value="<fmt:formatDate value='${cmstag.cmsCreationTime}' type='both' pattern='yyyy-MM-dd'/>" lay-verify="date"  placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>文档数量:</label>
			<div class="layui-input-block">
				<input type="number" name="cmsRefers" value="${cmstag.cmsRefers}" lay-verify="required" maxlength="10"  autocomplete="off" class="layui-input">
			</div>
		</div>--%>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="edit">编辑</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>
<script>
	//Demo
	layui.use(['layer', 'form','jquery','laydate'], function(){
		var layer = layui.layer
				,form = layui.form()
				,$ = layui.jquery
				,laydate = layui.laydate;
		//监听提交
		form.on('submit(edit)', function(data){
			//layer.msg(JSON.stringify(data.field));
			$.ajax({
				url: "/ez/cms/cmstag/update.do",
				type: "POST",
				data:$('#formid').serialize(),// 你的formid
				success: function (result) {
					if("suc"==(result.msg)){
						//关闭窗口
						top.layer.closeAll();
						top.layer.msg('修改成功!',{icon: 1});
					}else{
						top.layer.msg('修改失败!'+result.message,{icon: 2});
					}
				}
			});
			return false;
		});

	});
</script>
</body>
</html>
