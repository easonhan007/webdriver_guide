send keys模拟按键输入
=========

场景
----
sendKeys方法可以模拟一些组合键操作，比如ctrl+a等。另外有时候我们需要在测试时使用tab键将焦点转移到下一个元素，这时候也需要sendKeys。在某些更复杂的情况下，还会出现使用sendKeys来模拟上下键来操作下拉列表的情况。

代码
----
下面的代码演示了如何将A多行文本框中的内容清空并复制到B文本框中。
### send_keys.html
```
	<html>
		<head>
			<meta http-equiv="content-type" content="text/html;charset=utf-8" />
			<title>send keys</title>		
			<script type="text/javascript" async="" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
			<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />		
		</head>
		<body>
			<h3>send keys</h3>
			<div class="row-fluid">
			<div class="span3">		
				<div class="well">
					<label>A</label>
					<textarea rows="10", cols="10" id="A">I think watir-webdriver is better than selenium-webdriver</textarea>
				</div>			
			</div>
			<div class="span3">		
				<div class="well">
					<label>B</label>
					<textarea rows="10", cols="10" id="B"></textarea>
				</div>			
			</div>
			</div>		
		</body>
		<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	</html>
```

### send_keys.java
```
	import java.io.File;

	import org.openqa.selenium.By;
	import org.openqa.selenium.Keys;
	import org.openqa.selenium.WebDriver;
	import org.openqa.selenium.chrome.ChromeDriver;


	public class SendKeys {

		public static void main(String[] args) throws InterruptedException {
			WebDriver dr = new ChromeDriver();
			
			File file = new File("src/send_keys.html");
			String filePath = "file:///" + file.getAbsolutePath();
			System.out.printf("now accesss %s \n", filePath);
			
			dr.get(filePath);
			Thread.sleep(1000);
			
	//		copy content of A
			dr.findElement(By.id("A")).sendKeys(Keys.chord(Keys.CONTROL + "a"));
			Thread.sleep(1000);
			dr.findElement(By.id("A")).sendKeys(Keys.chord(Keys.CONTROL + "x"));
			
	//		paste to B
			dr.findElement(By.id("B")).sendKeys(Keys.chord(Keys.CONTROL + "v"));
			
	//		SendKeys to A
			dr.findElement(By.id("A")).sendKeys(Keys.chord("watir webdriver is better than selenium webdriver"));
			
			Thread.sleep(1000);
			System.out.println("browser will be close");
			dr.quit();	
		}

	}

```


