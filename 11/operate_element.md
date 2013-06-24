操作测试对象
============

场景
----
定位到具体的对象后，我们就可以对这个对象进行具体的操作，比如先前已经看到过的点击操作(click)。一般来说，webdriver中比较常用的操作对象的方法有下面几个

* click 点击对象
* send_keys 在对象上模拟按键输入
* clear 清除对象的内容，如果可以的话

代码
----
下面的代码演示了如何点击元素，如何往文本框中输入文字以及如何清空文字。
### operate_element.html
```
	<html>
		<head>
			<meta http-equiv="content-type" content="text/html;charset=utf-8" />
			<title>Level Locate</title>		
			<script type="text/javascript" async="" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
			<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />		
		</head>
		<body>
			<h3>Level locate</h3>
			<div class="span3">		
				<div class="well">
					<div class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Link1</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel" id="dropdown1" >
							<li><a tabindex="-1" href="#">Action</a></li>
							<li><a tabindex="-1" href="#">Another action</a></li>
							<li><a tabindex="-1" href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a tabindex="-1" href="#">Separated link</a></li>
						</ul>
					</div>				
				</div>			
			</div>
			<div class="span3">		
				<div class="well">
					<div class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Link2</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel" >
							<li><a tabindex="-1" href="#">Action</a></li>
							<li><a tabindex="-1" href="#">Another action</a></li>
							<li><a tabindex="-1" href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a tabindex="-1" href="#">Separated link</a></li>
						</ul>
					</div>				
				</div>			
			</div>
		</body>
		<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	</html>
```

### operate_element.rb
```
	#encoding: utf-8
	require 'selenium-webdriver'

	dr = Selenium::WebDriver.for :chrome
	file_path = 'file:///' + File.expand_path(File.join('.', 'operate_element.html'))

	dr.get file_path
	#click
	dr.find_element(:link_text, 'Link1').click
	sleep(1)
	dr.find_element(:link_text, 'Link1').click

	#send_keys
	element = dr.find_element(:name, 'q')
	element.send_keys('something')
	sleep(1)

	#clear
	element.clear()

	sleep(2)
	dr.quit

```


