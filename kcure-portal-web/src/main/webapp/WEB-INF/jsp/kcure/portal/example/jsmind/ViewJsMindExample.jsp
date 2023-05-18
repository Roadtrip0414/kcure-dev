<%
/* =================================================================
* @FileName : ViewQna.jsp
* @date: 2023. 3. 14.
* @author : shpark
* @설명 : jsmadin 샘플
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript" src="/js/plugin/jsmind/jsmind.js"></script>
 <link type="text/css" rel="stylesheet" href="/js/plugin/jsmind/jsmind.css" />
        <style type="text/css">
            #jsmind_container {
                width: 800px;
                height: 500px;
                border: solid 1px #ccc;
                /*background:#f4f4f4;*/
                background: #f4f4f4;
            }
        </style>
<script type="text/javascript">

</script>
<div class="wrap">
<div class="sub_visual_wrap">
		<div class="notice">
			<ul>
				<li>jsmind</li>
			</ul>
		</div>
	</div>
	<div class="inquiry_list_wrap">
		<div class="con">
		<div id="jsmind_container"></div>

        <script type="text/javascript">
        var test = function(param){
        	console.log(param.id);
        	console.log(param.topic,param.data.test);
        	alert(param.data.test);
        };
            var mind = {
            		meta: {
                        name: 'test',
                        author: 'hizzgdev@163.com',
                        version: '0.2',
                    },
                    format: 'node_array',
            		 data: [
                         { id: 'root1', isroot: true, topic: 'jsMind1' },
                         { id: 'sub1', parentid: 'root1', topic: 'sub1' },
                         { id: 'sub11', parentid: 'sub1', topic: 'sub11' ,test:'sub11',clickEvent:test},
                         { id: 'sub12', parentid: 'sub1', topic: 'sub12' ,test:'sub12',clickEvent:test},
                         { id: 'sub13', parentid: 'sub1', topic: 'sub13' ,test:'sub13',clickEvent:test},
                         
                         { id: 'sub2', parentid: 'root1', topic: 'sub2'  },
                         { id: 'sub21', parentid: 'sub2', topic: 'sub21' ,test:'sub21',clickEvent:test},
                         { id: 'sub22', parentid: 'sub2', topic: 'sub22' ,test:'sub22',clickEvent:test},
                         { id: 'sub23', parentid: 'sub2', topic: 'sub23' ,test:'sub23',clickEvent:test},
                         ]
                // 3 data formats were supported ...
                // see documents for more information
            };
            var options = {
                container: 'jsmind_container',
                theme: 'orange',
                editable: true,
            };
            var jm = new jsMind(options);
            jm.show(mind);
            jm.collapse_all();
            jm.disable_edit();
        </script>
		<!-- 
		 <div id="jsmind_container"></div>
		<script type="text/javascript">
            var _jm = null;
            function load_jsmind() {
                var mind = {
                    meta: {
                        name: 'demo',
                        author: 'hizzgdev@163.com',
                        version: '0.2',
                    },
                    format: 'node_array',
                    data: [
                        { id: 'root1', isroot: true, topic: 'jsMind1' },

                        { id: 'sub1', parentid: 'root1', topic: 'sub1' },
                        { id: 'sub11', parentid: 'sub1', topic: 'sub11' },
                        { id: 'sub12', parentid: 'sub1', topic: 'sub12' },
                        { id: 'sub13', parentid: 'sub1', topic: 'sub13' },

                        { id: 'sub2', parentid: 'root1', topic: 'sub2' },
                        { id: 'sub21', parentid: 'sub2', topic: 'sub21' },
                        { id: 'sub22', parentid: 'sub2', topic: 'sub22' },

                        { id: 'sub3', parentid: 'root1', topic: 'sub3' },
                    ],
                };
                var options = {
                    container: 'jsmind_container',
                    editable: true,
                    theme: 'primary',
                    shortcut: {
                        handles: {
                            test: function (j, e) {
                                console.log(j);
                            },
                        },
                        mapping: {
                            test: 89,
                        },
                    },
                };
                _jm = jsMind.show(options, mind);
                // jm.set_readonly(true);
                // var mind_data = jm.get_data();
                // alert(mind_data);
            }

            function load_file(fi) {
                var files = fi.files;
                if (files.length > 0) {
                    var file_data = files[0];
                    jsMind.util.file.read(file_data, function (freemind_data, jsmind_name) {
                        var mind = jsmind_data;
                        if (!!mind) {
                            _jm.show(mind);
                        } else {
                            console.error('can not open this file as mindmap');
                        }
                    });
                }
            }

            function save_nodetree() {
                var mind_data = _jm.get_data('node_tree');
                console.log(mind_data);
            }

            function replay() {
                var shell = _jm.shell;
                if (!!shell) {
                    shell.replay();
                }
            }

            load_jsmind();
        </script>
         -->
		</div>
	</div>
	
</div>
