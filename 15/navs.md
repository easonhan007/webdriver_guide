处理navs
=========

场景
----
navs可以看作是简单的类似于tab的导航栏。一般来说导航栏都是ul+li。先定位ul再去层级定位li中的link基本就能解决问题。

代码
----
### navs.html
```
	<html>
		<head>
			<meta http-equiv="content-type" content="text/html;charset=utf-8" />
			<title>Navs</title>		
			<script type="text/javascript" async="" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
			<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />		
			<script type="text/javascript">
				$(document).ready(
					function(){
						$('.nav').find('li').click(function() {
							$(this).parent().find('li').removeClass('active');
							$(this).addClass('active');
						});
					}
				);
			</script>
		</head>
		<body>
			<h3>Navs</h3>
			<div class="row-fluid">
				<div class="span3">		
					<ul class="nav nav-pills">
						<li class="active">
							<a href="#">Home</a>
						</li>
						<li><a href="#">Content</a></li>
						<li><a href="#">About</a></li>
					</ul>
				</div>		
			</div>		
		</body>
		<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	</html>
```

### navs.rb
```
	#encoding: utf-8
	require 'selenium-webdriver'

	dr = Selenium::WebDriver.for :chrome
	file_path = 'file:///' + File.expand_path(File.join('.', 'navs.html'))
	dr.get file_path

	# 方法1：层级定位，先定位ul再定位li
	dr.find_element(:class, 'nav').find_element(:link_text, 'About').click()
	sleep(1)

	# 方法2: 直接定位link
	dr.find_element(:link_text, 'Home').click()

	dr.quit()
```

