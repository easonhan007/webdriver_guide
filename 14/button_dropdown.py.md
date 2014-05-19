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
		<title>button dropdown</title>		
		<script type="text/javascript" async="" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />		
		<script type="text/javascript">
			$(document).ready(
				function(){
					$('.dropdown-menu').find('a').first().click(function(){ alert('watir-webdriver is better than selenium-webdriver'); });
				}
			);
		</script>
	</head>
	<body>
		<h3>button dropdown</h3>
		<div class="row-fluid">
			<div class="span3">		
				<div class="well">
					<div class="btn-group">
						<a class="btn dropdown-toggle btn-info" data-toggle="dropdown" href="#">
							Info
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#">watir-webdriver</a></li>
							<li><a href="#">better than</a></li>
							<li><a href="#">selenium-webdriver</a></li>
						</ul>
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
#coding=utf-8

from selenium import  webdriver
from selenium.webdriver.support.ui import  WebDriverWait
from time import  sleep
import  os

if 'HTTP_PROXY' in os.environ: del os.environ['HTTP_PROXY']

dr = webdriver.Chrome()
file_path = 'file:///' + os.path.abspath('button_dropdown.html')
dr.get(file_path)

sleep(1)

#点击下拉菜单
dr.find_element_by_link_text('Info').click()

#找到dropdown-menu父元素
WebDriverWait(dr,10).until(lambda the_driver: the_driver.find_element_by_class_name('dropdown-menu').is_displayed())

#找到better than
menu = dr.find_element_by_class_name('dropdown-menu').find_element_by_link_text('better than')

menu.click()

sleep(3)

dr.quit()

```


