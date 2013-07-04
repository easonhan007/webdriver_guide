获取测试对象的属性及内容
========================

场景
----
获取测试对象的内容是前端自动化测试里一定会使用到的技术。比如我们要判断页面上是否显示了一个提示，那么我们就需要找到这个提示对象，然后获取其中的文字，再跟我们的预期进行比较。在webdriver中使用element.getAttribute()方法可以获取dom元素(测试对象)的属性。

获取测试对象的属性能够帮我们更好的进行对象的定位。比如页面上有很多class都是'btn'的div，而我们需要定位其中1个有具有title属性的div。由于selenium-webdriver是不支持直接使用title来定位对象的，所以我们只能先把所有class是btn的div都找到，然后遍历这些div，获取这些div的title属性，一旦发现具体title属性的div，那么返回这个div既可。在webdriver中，使用element.getText()方法可以返回dom节点的内容(text)。

代码
----
下面的代码演示了如何获取测试对象的title属性和该对象的文字内容

### attribute.html
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

### attribute.java
```
	import java.io.File;
	import java.util.List;

	import org.openqa.selenium.By;
	import org.openqa.selenium.WebDriver;
	import org.openqa.selenium.WebElement;
	import org.openqa.selenium.chrome.ChromeDriver;


	public class Attribute {

		public static void main(String[] args) throws InterruptedException {
			WebDriver dr = new ChromeDriver();
			
			File file = new File("src/attribute.html");
			String filePath = "file:///" + file.getAbsolutePath();
			System.out.printf("now accesss %s \n", filePath);
			
			dr.get(filePath);
			Thread.sleep(1000);
			
			WebElement link = dr.findElement(By.id("tooltip"));
			
	//		获得tooltip的内容
			System.out.println(link.getAttribute("data-original-title"));
			
	//		获取该链接的text
			System.out.println(link.getText());
			
			Thread.sleep(1000);
			System.out.println("browser will be close");
			dr.quit();	
		}

	}

```

