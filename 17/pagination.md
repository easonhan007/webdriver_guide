处理分页
=========

场景
----
对分页来说，我们最感兴趣的是下面几个信息

* 总共有多少页
* 当前是第几页
* 是否可以上一页和下一页

代码
----
下面的代码演示了如何获取分页的总数以及当前是第几页

### pagination.html
```
	<html>
		<head>
			<meta http-equiv="content-type" content="text/html;charset=utf-8" />
			<title>Pagination</title>		
			<script type="text/javascript" async="" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
			<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />		
			<script type="text/javascript">
				$(document).ready(function(){
					$('.pagination').find('li').click(function(){
						$(this).parent().find('li').removeClass('active');
						$(this).addClass('active');
					});
				});
			</script>
		</head>
			
		<body>
			<h3>Pagination</h3>
			<div class="row-fluid">
				<div class="span6">		
					<div class="pagination pagination-large">
						<ul>
							<li><a href="#">Prev</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">Next</a></li>
						</ul>
					</div>
				</div>		
			</div>		
		</body>
		<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	</html>
	
```

### pagination.rb
```
	#encoding: utf-8
	require 'selenium-webdriver'

	dr = Selenium::WebDriver.for :chrome
	file_path = 'file:///' + File.expand_path(File.join('.', 'pagination.html'))
	dr.get file_path

	# 获得所有分页的数量
	# -2是因为要去掉上一个和下一个
	total_pages = dr.find_element(:class, 'pagination').find_elements(:tag_name, 'li').size - 2
	puts "total page is #{total_pages}"

	# 获取当前页面的url以及当前页面是第几页
	current_page = dr.find_element(:class, 'pagination').find_element(:class, 'active')
	puts "current page is #{current_page.text}"
	dr.quit()
```

