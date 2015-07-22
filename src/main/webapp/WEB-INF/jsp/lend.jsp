<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>  
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>P2P网-我要投资</title>
	<link href="${ctx}/css/carousel.css" rel="stylesheet">
	<style type="text/css">
	.container-nav ol {
	  background-color: #F2F2F2;
	}
	.col-divider {
	  border-right: 1px solid #F2F2F2;
	}
	.container-content > .row {
	  margin-top: 10px;
	  margin-bottom: 10px;
	}
	.row-height {
	  height: 5px;
	}
	.dataTables_wrapper .dataTables_length {
	  padding-top: 0.755em;
	}
	</style>
	<link href="${ctx}/css/jquery.dataTables.min.css" rel="stylesheet">
</head>

<body>
	
	<div class="container">
	  <div class="container-nav">
	    <ol class="breadcrumb">
		  <li><a href="#">首页</a></li>
		  <li><a href="#">我要投资</a></li>
		  <li class="active">投资项目</li>
		</ol>
	  </div>
	  <div class="container container-content">
	    <div class="row">
		  <div class="col-md-8 col-divider">
		    <h4>项目列表</h4>
		    <div class="row">
		      <div class="col-sm-2"><h5>标的类型</h5></div>
		      <div class="col-sm-10">
		      <div class="btn-group btn-group-sm" role="group" aria-label="...">
			    <button type="button" class="btn btn-primary">不限</button>
			    <button type="button" class="btn btn-default">信用认证标</button>
			    <button type="button" class="btn btn-default">实地认证标</button>
			    <button type="button" class="btn btn-default">机构担保标</button>
			    <button type="button" class="btn btn-default">智能理财标</button>
			  </div>
			  </div>
		    </div>
		    <div class="row-height"></div>
		    <div class="row">
		      <div class="col-sm-2"><h5>借款期限</h5></div>
		      <div class="col-sm-10">
		      <div class="btn-group btn-group-sm" role="group" aria-label="...">
			    <button type="button" class="btn btn-primary">不限</button>
			    <button type="button" class="btn btn-default">6个月及以下</button>
			    <button type="button" class="btn btn-default">7-12个月</button>
			    <button type="button" class="btn btn-default">13-24个月</button>
			    <button type="button" class="btn btn-default">25个月及以上</button>
			  </div>
			  </div>
		    </div>
		    <div class="row-height"></div>
		    <div class="row">
		      <div class="col-sm-2"><h5>认证等级</h5></div>
		      <div class="col-sm-10">
		      <div class="btn-group btn-group-sm" role="group" aria-label="...">
			    <button type="button" class="btn btn-primary">不限</button>
			    <button type="button" class="btn btn-default">AA</button>
			    <button type="button" class="btn btn-default">A</button>
			    <button type="button" class="btn btn-default">B</button>
			    <button type="button" class="btn btn-default">C</button>
			    <button type="button" class="btn btn-default">D</button>
			    <button type="button" class="btn btn-default">E</button>
			    <button type="button" class="btn btn-default">HR</button>
			  </div>
			  </div>
		    </div>
		  </div>
		  <div class="col-md-4">
		  	<h4>新手引导</h4>
		  	<div class="row-height"></div>
		    <div>什么是信用等级？</div>
		    <div class="row-height"></div>
	    	<div>什么是信用认证标？</div>
	    	<div class="row-height"></div>
	    	<div>什么是实地认证标？</div>
	    	<div class="row-height"></div>
	    	<div>什么是机构担保标？</div>
		  </div>
		</div>
	  </div>
	  <br>
	  <div class="container container-content">
	  	<table class="table" id="table-list">
	  	  <caption><h4>投资列表</h4></caption>
	      <thead>
	        <tr>
	          <th>借款标题</th>
	          <th>信用等级</th>
	          <th>年利率</th>
	          <th>金额</th>
	          <th>期限</th>
	          <th>进度</th>
	          <th></th>
	        </tr>
	      </thead>
	      <tbody></tbody>
	  	</table>
	  	<div class="row-height"></div>
	  </div>
	</div>
	<jscript>
	<script src="${ctx}/js/jquery.dataTables.min.js"></script>
	<script>
	var table;
	$(document).ready(function() {
		table = $('#table-list').dataTable({
    		"language": {
                "lengthMenu": "每页 _MENU_ 条记录",
                "zeroRecords": "没有找到记录",
                "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
                "infoEmpty": "无记录",
                "infoFiltered": "(从 _MAX_ 条记录过滤)",
                "search": "搜索",
                "paginate": {
			         "first":    "第一页",
			         "previous": "上一页 ",
			         "next":     "下一页 ",
			         "last":     "最后一页 "
			     }
            },
            //"dom": "<'row'<'col-xs-2'l><'#mytool.col-xs-4'><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
            "dom": "<'toolbar'>rt<'bottom'<'row'<'col-xs-2'i><'col-xs-10'p>><'clear'>>",
            //"dom": '<"toolbar">rt<"bottom"ilp<"clear">>',
    		//"pagingType":  "full_numbers",
    		//"scrollX": "100%",
    		//"scrollXInner": "100%",
    		"filter": true, 
    		"processing": true,
            "serverSide": true,
            "ajax": {
				"url": "${ctx}/lend/list",
				"type": "POST"
			},
			"order": [[ 0, "desc" ]],
			"columnDefs": [
				{
					"render": function(data, type, row) {
				        	return "<a href=\"${ctx}/lend/detail/" + data.id + "\">" + data.title + "</a>";
				    },
				    "targets": [0]
				},
			    {
			    	"render": function(data, type, row) {
			            	return "<span class=\"badge\">" + data.level + "</span>";
			        },
			        "targets": [1]
			    },
			    {
			    	"render": function(data, type, row) {
			            	return "<span class=\"badge\">80%</span>";
			        },
			        "targets": [5]
			    },
			    {
	            	"searchable": false,
			    	"orderable": false,
	            	"render": function(data, type, row) {
		                var content = "";
		                content += "<button type=\"button\" class=\"btn btn-primary\">投标</button>";
		            	return content;
		            },
		            "targets": [6]
	            }
			],
			"columns": [
	            { "data": null },
	            { "data": null },
	            { "data": "yearRate" },
	            { "data": "money" },
	            { "data": "term" },
	            { "data": null },
	            { "data": null }
	        ]
    	});
		/* $('#table-list tbody')
        .on( 'mouseover', 'td', function () {
            var colIdx = table.cell(this).index().column;
            if ( colIdx !== lastIdx ) {
                $( table.cells().nodes() ).removeClass( 'highlight' );
                $( table.column( colIdx ).nodes() ).addClass( 'highlight' );
            }
        } )
        .on( 'mouseleave', function () {
            $( table.cells().nodes() ).removeClass( 'highlight' );
        } ); */
	});
	</script>
	</jscript>
</body>
</html>
