上传文件
========

场景
----
上传文件的方法是找到上传文件的对象，通常是<input type="file" />的对象。然后直接往这个对象sendKeys，传入需要上传文件的正确路径。绝对路径和相对路径都可以，但是上传的文件必须存在，否则会报错。

代码
----

### upload_file.html
```
  <html>
    <head>
      <meta http-equiv="content-type" content="text/html;charset=utf-8" />
      <title>upload_file</title>		
      <script type="text/javascript" async="" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
      <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />		
      <script type="text/javascript">
      </script>
    </head>
      
    <body>
      <div class="row-fluid">
        <div class="span6 well">		
          <h3>upload_file</h3>
          <input type="file" name="file" />
        </div>		
      </div>		
    </body>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
  </html>
```

### upload_file.java
```
	import java.io.File;
	import java.util.List;

	import org.openqa.selenium.Alert;
	import org.openqa.selenium.By;
	import org.openqa.selenium.Keys;
	import org.openqa.selenium.WebDriver;
	import org.openqa.selenium.WebElement;
	import org.openqa.selenium.chrome.ChromeDriver;


	public class Upload {

		public static void main(String[] args) throws InterruptedException {
			WebDriver dr = new ChromeDriver();
			
			File file = new File("src/upload_file.html");
			String filePath = "file:///" + file.getAbsolutePath();
			System.out.printf("now accesss %s \n", filePath);
			
			dr.get(filePath);
			Thread.sleep(1000);
			
			dr.findElement(By.cssSelector("input[type=file]")).sendKeys("src/navs.html");
			
			Thread.sleep(1000);
			System.out.println("browser will be close");
			dr.quit();	
		}

	}
```
