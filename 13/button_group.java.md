处理button group
==================

场景
----
button group就是按钮组，将一组按钮排列在一起。处理这种对象的思路一般是先找到button group的包裹(wrapper)div，然后通过层级定位，用index或属性去定位更具体的按钮。

代码
----
下面的代码演示了如何找到second这个按钮。其处理方法是先找到button group的父div，class为btn-group的div，然后再找到下面所有的div(也就是button)，返回text是second的div。
### button_group.html
```
	<html>
		<head>
			<meta http-equiv="content-type" content="text/html;charset=utf-8" />
			<title>button group</title>		
			<script type="text/javascript" async="" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
			<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />		
			<script type="text/javascript">
				$(document).ready(function(){
					$('.btn').click(function(){
						alert($(this).text());
					});
				});			
			</script>
		</head>
		<body>
			<h3>button group</h3>
			<div class="row-fluid">
				<div class="span3">		
					<div class="well">
						<div class="btn-toolbar">
							<div class="btn-group">
								<div class="btn">first</div>
								<div class="btn">second</div>
								<div class="btn">third</div>
							</div>
						</div>
					</div>			
				</div>		
			</div>		
		</body>
		<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	</html>
```

### button_group.java
```
	import java.io.File;
	import java.util.List;

	import org.openqa.selenium.By;
	import org.openqa.selenium.Keys;
	import org.openqa.selenium.WebDriver;
	import org.openqa.selenium.WebElement;
	import org.openqa.selenium.chrome.ChromeDriver;


	public class ButtonGroup {

		public static void main(String[] args) throws InterruptedException {
			WebDriver dr = new ChromeDriver();
			
			File file = new File("src/button_group.html");
			String filePath = "file:///" + file.getAbsolutePath();
			System.out.printf("now accesss %s \n", filePath);
			
			dr.get(filePath);
			Thread.sleep(1000);
			
	//		定位text是second的按钮
			List<WebElement> btns = dr.findElement(By.className("btn-group")).findElements(By.className("btn"));
			
			for(WebElement btn : btns){
				if(btn.getText().equals("second")){
					btn.click();
					break;
				}
			}
			
			Thread.sleep(1000);
			System.out.println("browser will be close");
			dr.quit();	
		}

	}

```

讨论
----
自己查资料搞清楚detect方法的作用。
