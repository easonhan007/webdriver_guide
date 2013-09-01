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

### navs.py
```
# -*- coding: utf-8 -*- 
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep
import os
if 'HTTP_PROXY'in os.environ: del os.environ['HTTP_PROXY']

dr = webdriver.Chrome()
file_path = 'file:///' + os.path.abspath('navs.html')

dr.get(file_path)

sleep(1)

# 方法1：层级定位，先定位ul再定位li
dr.find_element_by_class_name('nav').find_element_by_link_text('About').click()
sleep(1)

# 方法2: 直接定位link
dr.find_element_by_link_text('Home').click()
sleep(1)

dr.quit()

```

