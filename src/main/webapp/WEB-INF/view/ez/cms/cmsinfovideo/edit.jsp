<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>视频管理编辑</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">
		<input type="hidden" name="emVideoId" value="${cmsinfovideo.emVideoId}"/>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>视频标题:</label>
			<div class="layui-input-block">
				<input type="text" name="emVideoTitle" value="${cmsinfovideo.emVideoTitle}"  placeholder="请输入视频标题" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>视频位置:</label>
			<div class="layui-input-block">
				<select name="positionId" id="positionId" lay-verify="required">
					<option value="">请选择视频所属位置</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">标题图:</label>
			<div class="layui-input-block">
				<input type="file" name="file" lay-ext="jpg|png|gif" lay-title="上传图片" id="uploadimg" class="layui-upload-file">
				<input type="hidden" name="emVideoPicpath" value="${cmsinfovideo.emVideoPicpath}">
				<img id="emVideoPicpath" src="${cmsinfovideo.emVideoPicpath}" alt="" width="80%">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>视频:</label>
			<div class="layui-input-block">
				<input type="file" name="file"  lay-type="video" lay-title="上传视频" id="uploadvideo" class="layui-upload-file">
				<input type="hidden" name="emVideoPath" lay-verify="required" value="${cmsinfovideo.emVideoPath}">
				<video src="${cmsinfovideo.emVideoPath}" id="emVideoPath"  controls="controls"  width="80%">
				</video>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">视频排序:</label>
			<div class="layui-input-block">
				<input type="number" name="emVideoOrder" value="${cmsinfovideo.emVideoOrder}"   maxlength="10"  autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">发布状态:</label>
			<div class="layui-input-block">
				<c:if test="${cmsinfovideo.emVideoStat==0}">
					<input type="checkbox" name="emVideoStat" lay-skin="switch" lay-text="启用|禁用"  value="1">
				</c:if>
				<c:if test="${cmsinfovideo.emVideoStat==1}">
					<input type="checkbox" name="emVideoStat" lay-skin="switch" lay-text="启用|禁用" checked value="1">
				</c:if>
			</div>
		</div>
<%--		<div class="layui-form-item">
			<label class="layui-form-label">录入者:</label>
			<div class="layui-input-block">
				<input type="text" name="author" value="${cmsinfovideo.author}"  placeholder="请输入录入者" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">录入时间:</label>
			<div class="layui-input-block">
				<input type="text" name="emVideoInserttime" value="<fmt:formatDate value='${cmsinfovideo.emVideoInserttime}' type='both' pattern='yyyy-MM-dd'/>"  placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
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
    layui.use(['layer', 'form','jquery','laydate','upload','element'], function(){
        var layer = layui.layer
            ,form = layui.form()
            ,element = layui.element()
            ,$ = layui.jquery
            ,laydate = layui.laydate;
        //后台获取select值
        $.ajax({
            url: '/ez/system/sysdictionary/getSdBySdtCode.do',
            type: "POST",
            data:{code:1027,selected:'${cmsinfovideo.positionId}'},
            dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
            success: function (result) {
                $("#positionId").append(result);
                form.render('select');
            }
        });
        //上传图片
        layui.upload({
            elem: '#uploadimg',
            url: '/ez/cms/cmsinfoimg/uploadimg.do',
            method: 'post', //上传接口的http类型
            before: function(input){
                //返回的参数item，即为当前的input DOM对象
                //top.layer.msg('正在上传，请勿操作！');
                top.layer.load();
            },
            success: function(res,input){
                top.layer.closeAll('loading');
                if(res.msg == "suc"){
                    $("input[name=emVideoPicpath]").attr("value",res.url);
                    $("#emVideoPicpath").attr("src",res.url);
                    $("#emVideoPicpath").attr("alt",res.filename);
                    $("#emVideoPicpath").show();
                    top.layer.msg('上传成功！',{icon:1});
                }else{
                    top.layer.msg('上传失败!'+res.message,{icon: 2});
                }
            }
        });
        //上传视频
        layui.upload({
            elem: '#uploadvideo',
            url: '/ez/cms/cmsinfoimg/uploadimg.do',
            method: 'post', //上传接口的http类型
            before: function(input){
                //返回的参数item，即为当前的input DOM对象
                //top.layer.msg('正在上传，请勿操作！');
                top.layer.load();
            },
            success: function(res,input){
                top.layer.closeAll('loading');
                if(res.msg == "suc"){
                    $("input[name=emVideoPath]").attr("value",res.url);
                    $("#emVideoPath").attr("src",res.url);
                    $("#emVideoPath").show();
                    top.layer.msg('上传成功！',{icon:1});
                }else{
                    top.layer.msg('上传失败!'+res.message,{icon: 2});
                }
            }
        });
		//监听提交
		form.on('submit(edit)', function(data){
			//layer.msg(JSON.stringify(data.field));
			$.ajax({
				url: "/ez/cms/cmsinfovideo/update.do",
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
