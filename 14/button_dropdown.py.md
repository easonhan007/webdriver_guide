处理button dropdown
===================

场景
----
button dropdown就是把按钮和下拉菜单弄到了一起。处理这种对象的思路一般是先点击这个按钮，等待下拉菜单显示出来，然后使用层级定位方法来获取下拉菜单中的具体项。

代码
----
下面的代码演示了如何找到watir-webdriver这个菜单项。其处理方法是先点击info按钮，然后等到下拉菜单出现后定位下拉菜单的ul元素，再定位ul元素中link text为watir-webdriver的link，并点击之。
### button_dropdown.html
```
	<html>
		<head>
			<meta http-equiv="content-type" content="text/html;charset=utf-8" />
			<title>button group</title>		
			<script type="text/javascript" async="" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
			<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />		
			<script type="text/javascript">
				$(document).ready(function(){
					$('.btn').click(function(){
						alert($(this).text());
					});
				});			
			</script>
		</head>
		<body>
			<h3>button group</h3>
			<div class="row-fluid">
				<div class="span3">		
					<div class="well">
						<div class="btn-toolbar">
							<div class="btn-group">
								<div class="btn">first</div>
								<div class="btn">second</div>
								<div class="btn">third</div>
							</div>
						</div>
					</div>			
				</div>		
			</div>		
		</body>
		<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	</html>
```

### button_dropdown.py
```
# -*- coding: utf-8 -*- 
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep
import os
if 'HTTP_PROXY'in os.environ: del os.environ['HTTP_PROXY']

dr = webdriver.Chrome()
file_path = 'file:///' + os.path.abspath('button_group.html')

dr.get(file_path)

sleep(1)

# 定位text是second的按钮
buttons = dr.find_element_by_class_name('btn-group').find_elements_by_class_name('btn')
for btn in buttons:
	if btn.text == 'second': print 'find second button'

sleep(1)
dr.quit()

```


