<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>城市区域新增</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>

<div class="layui-field-box">
	<form id="formid" class="layui-form">
		<blockquote class="layui-elem-quote">
			<p>温馨提示：区域id要求为6位数的数字，数字规则请参考已存在的区域id的数字规则！</p>
		</blockquote>
		<div class="layui-form-item">
			<label class="layui-form-label">城市名:</label>
			<div class="layui-input-inline">
				<input type="text" name="name" lay-verify="required"  placeholder="请输入城市名" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">区域id:</label>
			<div class="layui-input-inline">
				<input type="number" name="id" value="000000" lay-verify="required"  class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
		</div>
		<%--<div class="layui-form-item">
			<label class="layui-form-label">url地址:</label>
			<div class="layui-input-inline">
				<input type="text" name="url" placeholder="请输入url地址" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">是否最明细科目:</label>
			<div class="layui-input-inline">
				<input type="checkbox" name="leaf" lay-skin="switch" lay-text="是|否"  value="1">
			</div>
		</div>--%>
		<div class="layui-form-item">
			<label class="layui-form-label">父级id:</label>
			<div class="layui-input-inline">
				<input type="number" name="parentId" value="0" readonly class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="add">保存</button>
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
		form.on('submit(add)', function(data){
			//layer.msg(JSON.stringify(data.field));
			$.ajax({
				url: "/ez/system/syscity/add.do",
				type: "POST",
				data:$('#formid').serialize(),// 你的formid
				success: function (result) {
					if("suc"==(result.msg)){
						//关闭窗口
						top.layer.closeAll();
						top.layer.msg('保存成功!',{icon: 1});
					}else{
						top.layer.msg('保存失败!'+result.message,{icon: 2},function () {
							location.reload();
						});
					}
				}
			});
			return false;
		});
	});
</script>
</body>
</html>
