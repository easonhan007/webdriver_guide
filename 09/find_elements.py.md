定位一组对象
============

场景
----
从上一节的例子中可以看出，webdriver可以很方便的使用find_element方法来定位某个特定的对象，不过有时候我们却需要定位一组对象，这时候就需要使用find_elements方法。

定位一组对象一般用于以下场景：

* 批量操作对象，比如将页面上所有的checkbox都勾上
* 先获取一组对象，再在这组对象中过滤出需要具体定位的一些对象。比如定位出页面上所有的checkbox，然后选择最后一个

代码
----

### checkbox.html
```
	<html>
		<head>
			<meta http-equiv="content-type" content="text/html;charset=utf-8" />
			<title>Checkbox</title>
			<script type="text/javascript" async="" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
			<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />
			<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
		</head>
		<body>
			<h3>checkbox</h3>
			<div class="well">
				<form class="form-horizontal">
					<div class="control-group">
						<label class="control-label" for="c1">checkbox1</label>
						<div class="controls">
							<input type="checkbox" id="c1" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="c2">checkbox2</label>
						<div class="controls">
							<input type="checkbox" id="c2" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="c3">checkbox3</label>
						<div class="controls">
							<input type="checkbox" id="c3" />
						</div>
					</div>						
					<div class="control-group">
						<label class="control-label" for="r">radio</label>
						<div class="controls">
							<input type="radio" id="r" />
						</div>
					</div>						
				</form>
			</div>
		</body>
	</html>
```

### find_element.rb
```
	#encoding: utf-8
	require 'selenium-webdriver'

	dr = Selenium::WebDriver.for :chrome
	file_path = 'file:///' + File.expand_path(File.join('.', 'checkbox.html'))

	dr.get file_path

	# 选择所有的checkbox并全部勾上
	dr.find_elements(:css, 'input[type=checkbox]').each {|c| c.click}
	dr.navigate.refresh()
	sleep 1

	# 打印当前页面上有多少个checkbox
	puts dr.find_elements(:css, 'input[type=checkbox]').size

	# 选择页面上所有的input，然后从中过滤出所有的checkbox并勾选之
	dr.find_elements(:tag_name, 'input').each do |input|
		input.click if input.attribute(:type) == 'checkbox'
	end 
	sleep 1

	# 把页面上最后1个checkbox的勾给去掉
	dr.find_elements(:css, 'input[type=checkbox]').last.click

	sleep 2
	dr.quit
```

讨论
----
checkbox.html必须与find_elments.rb在同一级目录下
