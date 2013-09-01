处理button group
==================

场景
----
button group就是按钮组，将一组按钮排列在一起。处理这种对象的思路一般是先找到button group的包裹(wrapper)div，然后通过层级定位，用index或属性去定位更具体的按钮。

代码
----
下面的代码演示了如何找到second这个按钮。其处理方法是先找到button group的父div，class为btn-group的div，然后再找到下面所有的div(也就是button)，返回text是second的div。
### button_group.html
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

### button_group.py
```python
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

讨论
----
自己查资料搞清楚detect方法的作用。
