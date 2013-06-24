send keys模拟按键输入
=========

场景
----
send_keys方法可以模拟一些组合键操作，比如ctrl+a等。另外有时候我们需要在测试时使用tab键将焦点转移到下一个元素，这时候也需要send_keys。在某些更复杂的情况下，还会出现使用send_keys来模拟上下键来操作下拉列表的情况。

代码
----
下面的代码演示了如何将A多行文本框中的内容清空并复制到B文本框中。
### send_keys.html
```
	<html>
		<head>
			<meta http-equiv="content-type" content="text/html;charset=utf-8" />
			<title>send keys</title>		
			<script type="text/javascript" async="" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
			<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />		
		</head>
		<body>
			<h3>send keys</h3>
			<div class="row-fluid">
			<div class="span3">		
				<div class="well">
					<label>A</label>
					<textarea rows="10", cols="10" id="A">I think watir-webdriver is better than selenium-webdriver</textarea>
				</div>			
			</div>
			<div class="span3">		
				<div class="well">
					<label>B</label>
					<textarea rows="10", cols="10" id="B"></textarea>
				</div>			
			</div>
			</div>		
		</body>
		<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	</html>
```

### send_keys.rb
```
	#encoding: utf-8
	require 'selenium-webdriver'

	dr = Selenium::WebDriver.for :chrome
	file_path = 'file:///' + File.expand_path(File.join('.', 'send_keys.html'))
	dr.get file_path

	# copy content of A
	dr.find_element(:id, 'A').send_keys([:control, 'a'])
	dr.find_element(:id, 'A').send_keys([:control, 'x'])
	sleep(1)

	# paste to B
	dr.find_element(:id, 'B').send_keys([:control, 'v'])
	sleep(1)

	# send keys to A
	dr.find_element(:id, 'A').send_keys('watir', '-', 'webdriver', :space, 'is', :space, 'better')
	sleep(2)

	dr.quit()
```


