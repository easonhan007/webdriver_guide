层级定位
========

场景
----
在实际的项目测试中，经常会有这样的需求：页面上有很多个属性基本相同的元素，现在需要具体定位到其中的一个。由于属性基本相当，所以在定位的时候会有些麻烦，这时候就需要用到层级定位。先定位父元素，然后再通过父元素定位子孙元素。

代码
----
下面的代码演示了如何通过层级定位来定位下拉菜单中的某一项。由于两个下拉菜单中每个选项的link text都相同，href也一样，所以在这里就需要使用层级定位了。

具体思路是：先点击显示出1个下拉菜单，然后再定位到该下拉菜单所在的ul，再定位这个ul下的某个具体的link。在这里，我们定位第1个下拉菜单中的Another action这个选项。

### level_locate.html
```
	<html>
		<head>
			<meta http-equiv="content-type" content="text/html;charset=utf-8" />
			<title>Level Locate</title>		
			<script type="text/javascript" async="" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
			<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />		
		</head>
		<body>
			<h3>Level locate</h3>
			<div class="span3">		
				<div class="well">
					<div class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Link1</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel" id="dropdown1" >
							<li><a tabindex="-1" href="#">Action</a></li>
							<li><a tabindex="-1" href="#">Another action</a></li>
							<li><a tabindex="-1" href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a tabindex="-1" href="#">Separated link</a></li>
						</ul>
					</div>				
				</div>			
			</div>
			<div class="span3">		
				<div class="well">
					<div class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Link2</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel" >
							<li><a tabindex="-1" href="#">Action</a></li>
							<li><a tabindex="-1" href="#">Another action</a></li>
							<li><a tabindex="-1" href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a tabindex="-1" href="#">Separated link</a></li>
						</ul>
					</div>				
				</div>			
			</div>
		</body>
		<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	</html>

```

### level_locate.java
```
	import java.io.File;

	import org.openqa.selenium.By;
	import org.openqa.selenium.WebDriver;
	import org.openqa.selenium.WebElement;
	import org.openqa.selenium.chrome.ChromeDriver;
	import org.openqa.selenium.interactions.Actions;
	import org.openqa.selenium.support.ui.ExpectedCondition;
	import org.openqa.selenium.support.ui.WebDriverWait;


	public class LevelLocate {

		public static void main(String[] args) throws InterruptedException {
			WebDriver dr = new ChromeDriver();
			
			File file = new File("src/level_locate.html");
			String filePath = "file:///" + file.getAbsolutePath();
			System.out.printf("now accesss %s \n", filePath);
			
			dr.get(filePath);
			Thread.sleep(1000);
			
			dr.findElement(By.linkText("Link1")).click();
			
			(new WebDriverWait(dr, 10)).until(new ExpectedCondition<Boolean>(){
				public Boolean apply(WebDriver d){
					return d.findElement(By.id("dropdown1")).isDisplayed();
				}
			} );
			
			WebElement menu = dr.findElement(By.id("dropdown1")).findElement(By.linkText("Another action"));
			(new Actions(dr)).moveToElement(menu).perform();
			
			Thread.sleep(1000);
			System.out.println("browser will be close");
			dr.quit();	
		}

	}


```

讨论
----
move_to方法实际上是模拟把鼠标移动到某个具体的测试对象上。
