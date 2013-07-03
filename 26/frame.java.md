定位frame中的元素
=================

场景
----
处理frame需要用到2个方法，分别是switchTo().frame(element|index|id)和switchTo.defaultContent()

switchTo().frame()方法的参数值得一提。其支持

* WebElement， 可以传入一个已经定位的frame元素。如 switchTo().frame(dr.findElement(By.id("myFrame")))
* int index， 可以传入页面上frame的索引，如0表示第1个frame
* String id, 可以传入frame的id

switchTo().frame()方法把当前定位的主体切换了frame里。怎么理解这句话呢？我们可以从frame的实质去理解。frame中实际上是嵌入了另一个页面，而webdriver每次只能在一个页面识别，因此才需要用switch_to.frame方法去获取frame中嵌入的页面，对那个页面里的元素进行定位。

switchTo.defaultContent方法的话则是从frame中嵌入的页面里跳出，跳回到最外面的原始页面中。

如果页面上只有1个frame的话那么这一切都是很好理解的，但如果页面上有多个frame，情况有稍微有点复杂了。

代码
----
下面的代码中frame.html里有个id为f1的frame，而f1中又嵌入了id为f2的frame，该frame加载了百度的首页。

### frame.html
```
  <html>
    <head>
      <meta http-equiv="content-type" content="text/html;charset=utf-8" />
      <title>frame</title>		
      <script type="text/javascript" async="" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
      <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />		
      <script type="text/javascript">
        $(document).ready(function(){
        });
      </script>
    </head>
      
    <body>
      <div class="row-fluid">
        <div class="span10 well">		
          <h3>frame</h3>
          <iframe id="f1" src="inner.html" width="800", height="600"></iframe>
        </div>		
      </div>		
    </body>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
  </html>
```

### inner.html
```
  <html>
    <head>
      <meta http-equiv="content-type" content="text/html;charset=utf-8" />
      <title>inner</title>		
    </head>
      
    <body>
      <div class="row-fluid">
        <div class="span6 well">		
          <h3>inner</h3>
          <iframe id="f2" src="http://www.baidu.com" width="700" height="500"></iframe>
          <a href="javascript:alert('watir-webdriver better than selenium webdriver;')">click</a>
        </div>		
      </div>		
    </body>
  </html>
```

### frame.java
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
	import org.openqa.selenium.support.ui.ExpectedCondition;
	import org.openqa.selenium.support.ui.WebDriverWait;


	public class Frame {

		public static void main(String[] args) throws InterruptedException {
			WebDriver dr = new ChromeDriver();
			
			File file = new File("src/frame.html");
			String filePath = "file:///" + file.getAbsolutePath();
			System.out.printf("now accesss %s \n", filePath);
			
			dr.get(filePath);
			Thread.sleep(1000);
			
	//		 先到f1再到f2
			dr.switchTo().frame("f1");
			dr.switchTo().frame("f2");
	//		往f2中的百度关键字文本框中输入内容
			dr.findElement(By.id("kw")).sendKeys("watir-webdriver");
			Thread.sleep(1000);
			
	//		直接跳出所有frame
			dr.switchTo().defaultContent();

	//		再到f1
			dr.switchTo().frame("f1");
			dr.findElement(By.linkText("click")).click();
			
			Thread.sleep(1000);
			System.out.println("browser will be close");
			dr.quit();	
		}

	}

```
讨论
----
假设页面上有A、B两个frame，其中B在A内，那么定位B中的内容则需要先到A，然后再到B。如果是定位A中的内容，那么直接switch_to.frame('A')就可以了;

页面中使用frame会影响页面渲染速度，如果你遇到页面中有多个frame的情况，你完全可以提出1个页面前端性能的缺陷;

如果实在搞不定页面上的frame，送你一句歌词：也许放弃才能靠近你。那么及时放弃跟此frame相关的用例才是明智之举;
