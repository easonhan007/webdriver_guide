处理alert/confirm/prompt
========================

场景
----
webdriver中处理原生的js alert confirm 以及prompt是很简单的。具体思路是使用switch_to.alert()方法定位到alert/confirm/prompt。然后使用text/accept/dismiss/send_keys按需进行操做

* getText。返回alert/confirm/prompt中的文字信息
* accept。点击确认按钮
* dismiss。点击取消按钮，如果有的话
* sendKeys。向prompt中输入文字

代码
----
下面代码简单的演示了如何去处理原生的alert
### alert.html

```
  <html>
    <head>
      <meta http-equiv="content-type" content="text/html;charset=utf-8" />
      <title>alert</title>		
      <script type="text/javascript" async="" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
      <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />		
      <script type="text/javascript">
        $(document).ready(function(){
          $('#tooltip').tooltip({"placement": "right"});
          $('#tooltip').click(function(){
              alert('watir-webdriver better than selenium-webdriver')
          });
        });
      </script>
    </head>
      
    <body>
      <div class="row-fluid">
        <div class="span6 well">		
          <h3>alert</h3>
          <a id="tooltip" href="#" data-toggle="tooltip" title="watir-webdriver better than selenium-webdriver">hover to see tooltip</a>
        </div>		
      </div>		
    </body>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
  </html>
```

### alert.java
```
	import java.io.File;
	import java.util.List;
	import org.openqa.selenium.Alert;
	import org.openqa.selenium.By;
	import org.openqa.selenium.JavascriptExecutor;
	import org.openqa.selenium.Keys;
	import org.openqa.selenium.WebDriver;
	import org.openqa.selenium.WebElement;
	import org.openqa.selenium.chrome.ChromeDriver;


	public class AlertExample {

		public static void main(String[] args) throws InterruptedException {
			WebDriver dr = new ChromeDriver();
			
			File file = new File("src/alert.html");
			String filePath = "file:///" + file.getAbsolutePath();
			System.out.printf("now accesss %s \n", filePath);
			
			dr.get(filePath);
			Thread.sleep(1000);
			
	//		点击链接弹出alert
			dr.findElement(By.id("tooltip")).click();
			
			Alert alert = dr.switchTo().alert();
			alert.accept();
							
			Thread.sleep(1000);
			System.out.println("browser will be close");
			dr.quit();	
		}

	}
```

