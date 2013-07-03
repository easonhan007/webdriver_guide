启动浏览器
==========

场景
----
在使用webdriver进行测试时启动浏览器无疑是必须的前置工作。

代码
----
```
	import org.openqa.selenium.WebDriver;
	import org.openqa.selenium.chrome.ChromeDriver;


	public class StartBrowser {

		public static void main(String[] args) {
			WebDriver dr = new ChromeDriver();
		}

	}
```


