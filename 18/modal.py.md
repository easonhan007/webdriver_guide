处理对话框
==========

场景
----
页面上弹出的对话框是自动化测试经常会遇到的一个问题。很多情况下这个弹出的对话框是一个iframe，处理起来有点麻烦，需要进行switch_to操作。但现在很多前端框架的对话框都是div形式的，这就让我们的处理变得十分简单了。

处理对话框一般会做下面的一些事情

* 打开对话框
* 关闭对话框
* 操作对话框中的元素

代码
----
下面的代码演示了如何打开、关闭以及点击对话框中的链接

### modal.html
```
	<html>
		<head>
			<meta http-equiv="content-type" content="text/html;charset=utf-8" />
			<title>modal</title>		
			<script type="text/javascript" async="" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
			<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />		
			<script type="text/javascript">
				$(document).ready(function(){
					$('#click').click(function(){
						$(this).parent().find('p').text('try watir-webdriver right now!');
					});
				});
			</script>
		</head>
			
		<body>
			<h3>modal</h3>
			<div class="row-fluid">
				<div class="span6">		
					<!-- Button to trigger modal -->
					<a href="#myModal" role="button" class="btn btn-primary" data-toggle="modal" id="show_modal">Click</a>
	 
					<!-- Modal -->
					<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h3 id="myModalLabel">Modal header</h3>
					  </div>
					  <div class="modal-body">
						<p>watir-webdriver is better than slenium-webdriver</p>
						<a href="#" id="click">click me</a>
					  </div>
					  <div class="modal-footer">
						<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
						<button class="btn btn-primary">Save changes</button>
					  </div>
					</div>
				</div>		
			</div>		
		</body>
		<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	</html>

```

### modal.py
```
# -*- coding: utf-8 -*- 
from selenium import webdriver
from time import sleep
import os
import selenium.webdriver.support.ui as ui
if 'HTTP_PROXY'in os.environ: del os.environ['HTTP_PROXY']

dr = webdriver.Chrome()
file_path = 'file:///' + os.path.abspath('modal.html')

dr.get(file_path)

# 打开对话框
dr.find_element_by_id('show_modal').click()

wait = ui.WebDriverWait(dr, 10)
wait.until(lambda dr: dr.find_element_by_id('myModal').is_displayed())

# 点击对话框中的链接
# 由于对话框中的元素被蒙板所遮挡，直接点击会报 Element is not clickable的错误
# 所以使用js来模拟click
# 在watir-webdriver中只需要fire_event(:click)就可以了
link = dr.find_element_by_id('myModal').find_element_by_id('click')
dr.execute_script('$(arguments[0]).click()', link)
sleep(2)

# 关闭对话框
buttons = dr.find_element_by_class_name('modal-footer').find_elements_by_tag_name('button')
buttons[0].click()

dr.quit()

```

