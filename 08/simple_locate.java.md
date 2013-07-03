简单的对象定位
==============

场景
----
测试对象的定位和操作是webdriver的核心内容，其中操作又是建立在定位的基础之上,因此对象定位就越发显得重要了。

定位对象的目的一般有下面几种

* 操作对象
* 获得对象的属性，如获得测试对象的class属性，name属性等等
* 获得对象的text
* 获得对象的数量

webdriver提供了一系列的对象定位方法，常用的有以下几种

* id
* name
* class name
* link text
* partial link text
* tag name
* xpath
* css selector

代码
----
### html代码 form.html
```
  <html>
    <head>
      <meta http-equiv="content-type" content="text/html;charset=utf-8" />
      <title>Form</title>
      <script type="text/javascript" async="" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
      <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />
      <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    </head>
    <body>
      <h3>simple login form</h3>
      <form class="form-horizontal">
        <div class="control-group">
          <label class="control-label" for="inputEmail">Email</label>
          <div class="controls">
            <input type="text" id="inputEmail" placeholder="Email" name="email">
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="inputPassword">Password</label>
          <div class="controls">
            <input type="password" id="inputPassword" placeholder="Password" name="password">
          </div>
        </div>
        <div class="control-group">
          <div class="controls">
            <label class="checkbox">
              <input type="checkbox"> Remember me
            </label>
            <button type="submit" class="btn">Sign in</button>
            <a href="#">register</a>
          </div>
        </div>
      </form>
    </body>
  </html>
```

### java代码 simple_locate.java
```
	import java.io.File;

	import org.openqa.selenium.By;
	import org.openqa.selenium.WebDriver;
	import org.openqa.selenium.WebElement;
	import org.openqa.selenium.chrome.ChromeDriver;
	import org.openqa.selenium.JavascriptExecutor;


	public class SimpleLocate {

		public static void main(String[] args) throws InterruptedException {
			WebDriver dr = new ChromeDriver();
			
			File file = new File("src/form.html");
			String filePath = "file:///" + file.getAbsolutePath();
			System.out.printf("now accesss %s \n", filePath);
			
			dr.get(filePath);
			Thread.sleep(2000);
			
	//		by id
			dr.findElement(By.id("inputEmail")).click();
			Thread.sleep(1000);
			
	//		by name
			dr.findElement(By.name("password"));
			Thread.sleep(1000);
			
	//		by tagname
			String classOfForm = dr.findElement(By.tagName("form")).getAttribute("class");
			System.out.printf("%s\n", classOfForm);
			Thread.sleep(1000);
			
	//		by link text
			WebElement link = dr.findElement(By.linkText("register"));
			((JavascriptExecutor)dr).executeScript("$(arguments[0]).fadeOut().fadeIn()", link);
			Thread.sleep(1000);

	//		by partial link test
			WebElement sameLink = dr.findElement(By.partialLinkText("reg"));
			((JavascriptExecutor)dr).executeScript("$(arguments[0]).fadeOut().fadeIn()", sameLink);
			Thread.sleep(1000);
			
	//		by css selector
			WebElement div = dr.findElement(By.cssSelector(".controls"));
			((JavascriptExecutor)dr).executeScript("$(arguments[0]).fadeOut().fadeIn()", div);
			Thread.sleep(1000);
			
	//		by xpath
			dr.findElement(By.xpath("/html/body/form/div[3]/div/label/input")).click();
			Thread.sleep(1000);
			
			System.out.println("browser will be close");
			dr.quit();	
		}

	}

```

讨论
----

上面例子里由于html文件中引用了jquery，所以在执行js时可以使用jquery的$()及fadeIn()等方法。如果你测试的页面没用包含jquery的话，这些方法是无效的。
