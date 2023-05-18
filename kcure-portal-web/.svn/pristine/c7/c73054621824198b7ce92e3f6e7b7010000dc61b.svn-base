<%@ page contentType = "text/html; charset=utf-8" %>
<%
	String uploadId = request.getParameter("uploadId");
	String url = request.getParameter("url");
	
	String useZip = request.getParameter("useZip");
	
	int maxNumberOfFiles = 0; 
	String sMaxNumberOfFiles = request.getParameter("maxNumberOfFiles");
	if (sMaxNumberOfFiles != null && sMaxNumberOfFiles != "") {
		maxNumberOfFiles = Integer.parseInt(sMaxNumberOfFiles);
	}
%>
<!-- Bootstrap styles -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
<link rel="stylesheet" href="/css/plugin/jquery.fileupload/jquery.fileupload.css">
<link rel="stylesheet" href="/css/plugin/jquery.fileupload/jquery.fileupload-ui.css">


	<input type="file" name="<%= uploadId %>" id="<%= uploadId %>">

<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
	  {% for (let i=0, file; file=o.files[i]; i++) { %}
		  <tr class="template-upload fade{%=o.options.loadImageFileTypes.test(file.type)?' image':''%}">
			  <td>
				  <span class="preview"></span>
				  <input type="hidden" name="fileSn" />
				  <input type="hidden" name="atchFileId" />
			  </td>
			  <td>
				  <p class="name">{%=file.name%}</p>
				  <strong class="error text-danger"></strong>
			  </td>
			  <td>
				  <p class="size">Processing...</p>
				  <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
			  </td>
			  <td>
				  {% if (!o.options.autoUpload && o.options.edit && o.options.loadImageFileTypes.test(file.type)) { %}
					<button class="btn btn-success edit" data-index="{%=i%}" disabled>
						<i class="glyphicon glyphicon-edit"></i>
						<span>Edit</span>
					</button>
				  {% } %}
				  {% if (!i && !o.options.autoUpload) { %}
					  <button class="btn btn-primary start" style="display:none" disabled>
						  <i class="glyphicon glyphicon-upload"></i>
						  <span>Start</span>
					  </button>
				  {% } %}
				  {% if (!i) { %}
					  <button class="btn btn-warning cancel">
						  <i class="glyphicon glyphicon-ban-circle"></i>
						  <span>Cancel</span>
					  </button>
				  {% } %}
			  </td>
		  </tr>
	  {% } %}
	</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
	  {% for (var i=0, file; file=o.files[i]; i++) { %}
		  <tr class="template-download fade{%=file.thumbnailUrl?' image':''%}">
			  <td>
				  <span class="preview">
					  {% if (file.thumbnailUrl) { %}
						  <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
					  {% } %}
				  </span>
			  </td>
			  <td>
				  <p class="name">
					  {% if (file.url) { %}
						  <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
					  {% } else { %}
						  <span>{%=file.name%}</span>
					  {% } %}
				  </p>
				  {% if (file.error) { %}
					  <div><span class="label label-danger">Error</span> {%=file.error%}</div>
				  {% } %}
			  </td>
			  <td>
				  <span class="size">{%=o.formatFileSize(file.size)%}</span>
			  </td>
			  <td>
				  {% if (file.deleteUrl) { %}
					  <button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
						  <i class="glyphicon glyphicon-trash"></i>
						  <span>Delete</span>
					  </button>
					  <input type="checkbox" name="delete" value="1" class="toggle">
				  {% } else { %}
					  <button class="btn btn-warning cancel">
						  <i class="glyphicon glyphicon-ban-circle"></i>
						  <span>Cancel</span>
					  </button>
				  {% } %}
			  </td>
		  </tr>
	  {% } %}
	</script>

<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="/js/jquery.ui.widget.js"></script>
<!-- The Templates plugin is included to render the upload/download listings -->
<script src="/js/plugin/jquery.fileupload/tmpl.min.js"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="/js/plugin/jquery.fileupload/load-image.all.min.js"></script>
<!-- The basic File Upload plugin -->
<script src="/js/plugin/jquery.fileupload/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="/js/plugin/jquery.fileupload/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="/js/plugin/jquery.fileupload/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="/js/plugin/jquery.fileupload/jquery.fileupload-audio.js"></script>
<!-- The File Upload validation plugin -->
<script src="/js/plugin/jquery.fileupload/jquery.fileupload-validate.js"></script>
<!-- The File Upload user interface plugin -->
<script src="/js/plugin/jquery.fileupload/jquery.fileupload-ui.js"></script>

<script src="/js/plugin/js.zip/jszip.min.js"></script>
<!-- The main application script -->
<script>
const configUpload = {
	useZip: <%= useZip %>,
	zipFileName: "content.zip",
	maxNumberOfFiles: <%= maxNumberOfFiles %>,
	maxSize: 0,
}

$(function () {
	"use strict";

	let _atchFileId = "";
	let _filesToZip = [];
	let _zip = new JSZip();
	let _zipAdded = false;

	function addFiles(data) {
		for (const file of data.files) {
			_filesToZip.push(file);
		}
	}
	function removeFiles(data) {
		for (const file of data.files) {
			const idx = _filesToZip.findIndex(f => f.lastModified == file.lastModified 
											&& f.size == file.size 
											&& f.name == file.name);
			if (idx !== -1) {
				_filesToZip.splice(idx, 1);
			}
		}
	}
	
	function addToZip() {
		_zip = new JSZip();
		for (const file of _filesToZip) {
			_zip.file(file.name, file);
		}
	}

	function cancelAllPending() {
		for (const elem of document.querySelectorAll("#<%= uploadId %> tbody.files .btn.cancel")) {
			elem.click();
		}
	}
	
	function addZippedAndStart() {
		_zip.generateAsync({ type: "blob" }).then(blob => {
			const type = "application/zip";
			const lastModified = new Date().getTime();
			const file = new File([blob], configUpload.zipFileName, { type, lastModified });		
			$('#<%= uploadId %>').fileupload("add", {files: [file]});
			
			delay(100).then(() => {
				const startBtn = document.querySelector("#<%= uploadId %> .fileupload-buttonbar button.start");
				startBtn.click();
			});
		});
	}
	
	$(document).bind('drop dragover', function (e) {
	    e.preventDefault();
	});
	
	// Initialize the jQuery File Upload widget:
	$("#<%= uploadId %>")
	.fileupload({
		// Uncomment the following to send cross-domain cookies:
		//xhrFields: {withCredentials: true},
		// url: 'server/php/'
		url: "<%= url %>",
		dropZone: $('#<%= uploadId %>'),
		maxNumberOfFiles: configUpload.useZip || configUpload.maxNumberOfFiles === 0 ? undefined : configUpload.maxNumberOfFiles,
		
	});
	$('#<%= uploadId %>').bind('fileuploadsend', function (e, data) {
		console.log("fileuploadsend");
	});
	$('#<%= uploadId %>').bind('fileuploaddone', function (e, data) {
		_atchFileId = "";
		_zip = new JSZip();
		_zipAdded = false;
		console.log("fileuploaddone");
	});
	$('#<%= uploadId %>').bind('fileuploadfail', function (e, data) {
		_atchFileId = "";
		console.log("fileuploadfail", e, data);
		if (configUpload.useZip && !_zipAdded) {
			removeFiles(data);
		}
	});
	$('#<%= uploadId %>').bind('fileuploadadd', function (e, data) {
		console.log("fileuploadadd", e, data);
		
		if (configUpload.useZip && !_zipAdded) {
			addFiles(data);
		}
	});
	$('#<%= uploadId %>').bind('fileuploaddrop', function (e, data) {
		console.log("fileuploaddrop", e, data);
		if (configUpload.useZip && !_zipAdded) {
			addFiles(data);
		}
	});
	$('#<%= uploadId %>').bind('fileuploadsubmit', function (e, data) {
		console.log("fileuploadsubmit", _zipAdded);
		
		if (configUpload.useZip && !_zipAdded) {
			addToZip();
			_zipAdded = true;
			cancelAllPending();
			addZippedAndStart();
			return false;
		} else {
			if (!_atchFileId) {
				_atchFileId = getTimeBasedUuid();
				for (const elem of document.querySelectorAll("input[name='atchFileId']")) {
					elem.value = _atchFileId;
				}
	
				let index = -1;
				for (const elem of document.querySelectorAll("input[name='fileSn']")) {
					index++;
					elem.value = index;
				}
			}
			
			var inputs = data.context.find(':input');
			data.formData = inputs.serializeArray();
		}
	});
});
</script>
