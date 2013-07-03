前进和后退
===========

场景
----
说实话，这两个功能一般不太常用。所能想到的场景大概也就是在几个页面间来回跳转，省去每次都get url。

代码
----

```
	import org.openqa.selenium.WebDriver;
	import org.openqa.selenium.chrome.ChromeDriver;


	public class ForwardAndBack {

		public static void main(String[] args) throws InterruptedException {
			WebDriver dr = new ChromeDriver();
			Thread.sleep(2000);
			
			String firstUrl = "http://www.baidu.com";
			System.out.printf("now accesss %s \n", firstUrl);
			dr.get(firstUrl);
			Thread.sleep(1000);
			
			String secondUrl = "http://www.soso.com";
			System.out.printf("now accesss %s \n", secondUrl);
			dr.get(secondUrl);
			Thread.sleep(1000);

			System.out.printf("now back to  %s \n", firstUrl);
			dr.navigate().back();
			Thread.sleep(1000);
		
			System.out.printf("forward to  %s \n", secondUrl);
			dr.navigate().forward();
			Thread.sleep(1000);
			
			System.out.println("browser will be close");
			dr.quit();	
		}

	}

```
