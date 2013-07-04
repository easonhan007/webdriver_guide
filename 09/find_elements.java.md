定位一组对象
============

场景
----
从上一节的例子中可以看出，webdriver可以很方便的使用findElement方法来定位某个特定的对象，不过有时候我们却需要定位一组对象，这时候就需要使用findElements方法。

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

### find_element.java
```
	import java.io.File;
	import java.util.List;

	import org.openqa.selenium.By;
	import org.openqa.selenium.WebDriver;
	import org.openqa.selenium.WebElement;
	import org.openqa.selenium.chrome.ChromeDriver;
	import org.openqa.selenium.JavascriptExecutor;


	public class SimpleLocate {

		public static void main(String[] args) throws InterruptedException {
			WebDriver dr = new ChromeDriver();
			
			File file = new File("src/checkbox.html");
			String filePath = "file:///" + file.getAbsolutePath();
			System.out.printf("now accesss %s \n", filePath);
			
			dr.get(filePath);
			Thread.sleep(1000);
			
	//		选择所有的checkbox并全部勾上
			List<WebElement> checkboxes = dr.findElements(By.cssSelector("input[type=checkbox]"));
			for(WebElement checkbox : checkboxes) {
				checkbox.click();
			}
			dr.navigate().refresh();
			
	//		打印当前页面上有多少个checkbox
			System.out.printf("%d\n", checkboxes.size());
			
	//		选择页面上所有的input，然后从中过滤出所有的checkbox并勾选之
			List<WebElement> inputs = dr.findElements(By.tagName("input"));
			for(WebElement input : inputs){
				if(input.getAttribute("type").equals("checkbox")){
					input.click();
				}
			}
			
	//		把页面上最后1个checkbox的勾给去掉
			List<WebElement> allCheckboxes = dr.findElements(By.cssSelector("input[type=checkbox]"));
			allCheckboxes.get(allCheckboxes.size() - 1).click();
			
			Thread.sleep(1000);
			System.out.println("browser will be close");
			dr.quit();	
		}

	}

```

讨论
----
checkbox.html必须与find_elments.rb在同一级目录下
