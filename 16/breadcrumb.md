处理面包屑
===========

场景
----
在实际的测试脚本中，有可能需要处理面包屑。处理面包屑主要是获取其层级关系，以及获得当前的层级。一般来说当前层级都不会是链接，而父层级则基本是以链接，所以处理面包屑的思路就很明显了。找到面包屑所在的div或ul，然后再通过该div或ul找到下面的所有链接，这些链接就是父层级。最后不是链接的部分就应该是当前层级了。

代码
----
### breadcrumb.html
```
	<html>
		<head>
			<meta http-equiv="content-type" content="text/html;charset=utf-8" />
			<title>breadcrumb</title>		
			<script type="text/javascript" async="" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
			<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />		
			<script type="text/javascript">
				$(document).ready(
					function(){
						
					}
				);
			</script>
		</head>
		<body>
			<h3>breadcrumb</h3>
			<div class="row-fluid">
				<div class="span3">		
					<ul class="breadcrumb">
						<li><a href="#">Home</a> <span class="divider">/</span></li>
						<li><a href="#">Library</a> <span class="divider">/</span></li>
						<li class="active">Data</li>
					</ul>
				</div>		
			</div>		
		</body>
		<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	</html>

```

### breadcrumb.rb
```
	#encoding: utf-8
	require 'selenium-webdriver'

	dr = Selenium::WebDriver.for :chrome
	file_path = 'file:///' + File.expand_path(File.join('.', 'breadcrumb.html'))
	dr.get file_path

	# 获得其父层级
	anstors = dr.find_element(:class, 'breadcrumb').find_elements(:tag_name, 'a').map { |link| link.text }
	p anstors
	sleep(1)

	# 获取当前层级
	# 由于页面上可能有很多class为active的元素
	# 所以使用层级定位最为保险
	puts dr.find_element(:class, 'breadcrumb').find_element(:class, 'active').text

	dr.quit()

```

