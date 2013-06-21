获取测试对象的状态
------------

场景
====
在web自动化测试中，我们需要获取测试对象的四种状态

* 是否显示。使用element.displayed?()方法；
* 是否存在。使用find_element方法，捕获其抛出的异常，如果是NoSuchElement异常的话则可以确定该元素不存在；
* 是否被选中。一般是判断表单元素，比如radio或checkbox是否被选中。使用element.selected?()方法；
* 是否enable，也就是是否是灰化状态。使用element.enabled?()方法；

代码
====

### css.html
```
	<html>
		<head>
			<meta http-equiv="content-type" content="text/html;charset=utf-8" />
			<title>attribute</title>		
			<script type="text/javascript" async="" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
			<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />		
			<script type="text/javascript">
				$(document).ready(function(){
					$('#tooltip').tooltip({"placement": "right"});
				});
			</script>
		</head>
			
		<body>
			<h3>attribute</h3>
			<div class="row-fluid">
				<div class="span6">		
					<a id="tooltip" href="#" data-toggle="tooltip" title="watir-webdriver better than selenium-webdriver">hover to see tooltip</a>
				</div>		
			</div>		
		</body>
		<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	</html>
```

### status.rb
```
	#encoding: utf-8
	require 'selenium-webdriver'

	dr = Selenium::WebDriver.for :chrome
	file_path = 'file:///' + File.expand_path(File.join('.', 'status.html'))
	dr.get file_path

	text_field = dr.find_element(:name, 'user')
	puts text_field.enabled?

	# 直接用enabled?方法去判断该button的话返回的会是true
	# 这是因为button是使用css方法去disabled的，并不是真正的disable
	# 这时候需要判断其class里是否有disabled这值来判断其是否处于disable状态
	puts dr.find_element(:class, 'btn').enabled?

	# 隐藏掉text_field
	# 判断其是否显示
	dr.execute_script('$(arguments[0]).hide()', text_field)
	puts text_field.displayed?

	# 使用click方法选择raido
	radio = dr.find_element(name: 'radio')
	radio.click()
	puts radio.selected?

	# 判断元素是否存在
	begin
		dr.find_element(id: 'none')
	rescue Selenium::WebDriver::Error::NoSuchElementError
		puts 'element does not exist'
	end 

	dr.quit()

```

讨论
====
在这里我们遇到了一种情况，那就是测试对象看上去是disabled，但是使用enabled方法却返回true。这时候一般思路是判断该对象的css属性或class，通过这些值去进一步判断对象是否disable。