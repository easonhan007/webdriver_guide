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

### pagination.java
```
	import java.io.File;
	import java.util.List;

	import org.openqa.selenium.By;
	import org.openqa.selenium.WebDriver;
	import org.openqa.selenium.WebElement;
	import org.openqa.selenium.chrome.ChromeDriver;


	public class Pagination {

		public static void main(String[] args) throws InterruptedException {
			WebDriver dr = new ChromeDriver();
			
			File file = new File("src/pagination.html");
			String filePath = "file:///" + file.getAbsolutePath();
			System.out.printf("now accesss %s \n", filePath);
			
			dr.get(filePath);
			Thread.sleep(1000);
			
	//		获得所有分页的数量
	//		-2是因为要去掉上一个和下一个
			int total_pages = dr.findElement(By.className("pagination")).findElements(By.tagName("li")).size() - 2;
			System.out.printf("Total page is %d\n", total_pages);
			
	//		取当前页面的url以及当前页面是第几页
			WebElement current_page = dr.findElement(By.className("pagination")).findElement(By.className("active"));
			System.out.printf("Current page is %s\n", current_page.getText());
			
			Thread.sleep(1000);
			System.out.println("browser will be close");
			dr.quit();	
		}

	}

```

