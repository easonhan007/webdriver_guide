获取测试对象的css属性
=====================

场景
----
当你的测试用例纠结细枝末节的时候，你就需要通过判断元素的css属性来验证你的操作是否达到了预期的效果。比如你可以通过判断页面上的标题字号以字体来验证页面的显示是否符合预期。当然，这个是强烈不推荐的。因为页面上最不稳定的就是css了，css变动频繁，而且通过属性也不能直观的判断页面的显示效果，还不如让人为的去看一眼，大问题一望即知。

代码
----
下面的代码演示了如何获取测试对象的css属性。

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

### css.java
```
	import java.io.File;
	import java.util.List;

	import org.openqa.selenium.By;
	import org.openqa.selenium.WebDriver;
	import org.openqa.selenium.WebElement;
	import org.openqa.selenium.chrome.ChromeDriver;


	public class Css {

		public static void main(String[] args) throws InterruptedException {
			WebDriver dr = new ChromeDriver();
			
			File file = new File("src/css.html");
			String filePath = "file:///" + file.getAbsolutePath();
			System.out.printf("now accesss %s \n", filePath);
			
			dr.get(filePath);
			Thread.sleep(1000);
			
			WebElement link = dr.findElement(By.id("tooltip"));
			
			System.out.println(link.getCssValue("color"));
			
			System.out.println(dr.findElement(By.tagName("h3")).getCssValue("font"));
			
			Thread.sleep(1000);
			System.out.println("browser will be close");
			dr.quit();	
		}

	}


```

