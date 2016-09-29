# Select

### 场景

在处理下拉框(select)的时候selenium给我们提供了一系列的便捷方法，我们只需要使用```selenium.webdriver.support.select.Select```类来稍微封装一下就好了。

源代码在[这里](https://github.com/SeleniumHQ/selenium/blob/master/py/selenium/webdriver/support/select.py)

下面是我们经常会用到的一些方法

* options: 返回下拉框里所有的选项
* all_selected_options: 返回所有选中的选项
* select_by_value(value): 通过option的value值来选择
* select_by_index(index) 通过option的顺序来选择
* select_by_visible_text(text): 通过option的text来选择


### 代码

select.html

```html
<html>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=utf-8" />
		<title>Select</title>
		<script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
		<link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	</head>

	<body>
		<div class="container">
			<h3>Select</h3>
			<div class="row">
				<form role="form">
					<div class="form-group">
						<label for="select-demo"> select your phone </label>
							<select id="select-demo" class="form-control">
								<option value="ip5s">iPhone 5s</option>
								<option value="ip6">iPhone 6</option>
								<option value="ip6s">iPhone 6s</option>
								<option value="ip7">iPhone 7</option>
								<option value="xiaomi">小米手机</option>
							</select>
					</div>

				</form>
			</div>
		</div>
	</body>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>
```

select.py

```python

# -*- coding: utf-8 -*-
from selenium import webdriver
from selenium.webdriver.support.select import Select
from time import sleep
import os

dr = webdriver.Firefox()
file_path = 'file:///' + os.path.abspath('select.html')
dr.get(file_path)

phone_selector = Select(dr.find_element_by_tag_name('select'))

# 返回所有的options
print(phone_selector.options)
sleep(1)

# 返回所有选中的options
print(phone_selector.all_selected_options)
sleep(1)

# 通过option的value值来选择iphone 7
phone_selector.select_by_value('ip7')
sleep(2)

# 通过index来选择，比如选择第2项
phone_selector.select_by_index(1)
sleep(1)

# 通过option的text来选择
phone_selector.select_by_visible_text('iPhone 6s')

dr.quit()
```
