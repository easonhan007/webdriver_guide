获取测试对象的状态
===================

场景
----
在web自动化测试中，我们需要获取测试对象的四种状态

* 是否显示。使用element.isDisplayed()方法；
* 是否存在。使用findElement方法，捕获其抛出的异常，如果是NoSuchElementException的话则可以确定该元素不存在；
* 是否被选中。一般是判断表单元素，比如radio或checkbox是否被选中。使用element.isSelected()方法；
* 是否enable，也就是是否是灰化状态。使用element.isEnabled()方法；

代码
----

### status.html
```
	<html>
		<head>
			<meta http-equiv="content-type" content="text/html;charset=utf-8" />
			<title>status</title>		
			<script type="text/javascript" async="" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
			<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />		
			<script type="text/javascript">
				$(document).ready(function(){
					$('#tooltip').tooltip({"placement": "right"});
				});
			</script>
		</head>
			
		<body>
			<h3>status</h3>
			<div class="row-fluid">
				<div class="span3">		
					<input name="user" placeholder="Disabled TextField" disabled  />				
				</div>		
				<div class="span3">
					<a class="btn disabled">Disabled Button</a>
				</div>
				<div class="span3">
					<input name="radio" type="radio" />
				</div>
			</div>		
		</body>
		<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	</html>
```

### status.java
```
	import java.io.File;
	import java.util.List;

	import org.openqa.selenium.By;
	import org.openqa.selenium.JavascriptExecutor;
	import org.openqa.selenium.NoSuchElementException;
	import org.openqa.selenium.WebDriver;
	import org.openqa.selenium.WebElement;
	import org.openqa.selenium.chrome.ChromeDriver;


	public class Status {

		public static void main(String[] args) throws InterruptedException {
			WebDriver dr = new ChromeDriver();
			
			File file = new File("src/status.html");
			String filePath = "file:///" + file.getAbsolutePath();
			System.out.printf("now accesss %s \n", filePath);
			
			dr.get(filePath);
			Thread.sleep(1000);	
			
			WebElement textField = dr.findElement(By.name("user"));
			System.out.println(textField.isEnabled());
			
	//		直接用isEnabled方法去判断该button的话返回的会是true
	//		这是因为button是使用css方法去disabled的，并不是真正的disable
	//		这时候需要判断其class里是否有disabled这值来判断其是否处于disable状态
			System.out.println(dr.findElement(By.className("btn")).isEnabled());
			
	//		隐藏掉textField
	//		判断其是否显示
			((JavascriptExecutor)dr).executeScript("$(arguments[0]).hide()", textField);
			System.out.println(textField.isDisplayed());
			
	//		使用click方法选择raido
			WebElement radio = dr.findElement(By.name("radio"));
			radio.click();
			System.out.println(radio.isSelected());
			
			try{
				dr.findElement(By.id("none"));
			} catch(NoSuchElementException e){
				System.out.println("element does not exist");
			}
			
			Thread.sleep(1000);
			System.out.println("browser will be close");
			dr.quit();	
		}

	}


```

讨论
----
在这里我们遇到了一种情况，那就是测试对象看上去是disabled，但是使用enabled方法却返回true。这时候一般思路是判断该对象的css属性或class，通过这些值去进一步判断对象是否disable。
