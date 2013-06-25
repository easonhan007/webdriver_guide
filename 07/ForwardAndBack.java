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
