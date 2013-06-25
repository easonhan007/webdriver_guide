import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;


public class TitleAndUrl {

	public static void main(String[] args) throws InterruptedException {
		WebDriver dr = new ChromeDriver();
		Thread.sleep(2000);
		
		String url = "http://www.baidu.com";
		System.out.printf("now accesss %s \n", url);
		
		dr.get(url);
		Thread.sleep(2000);
		
		System.out.printf("title of current page is %s\n", dr.getTitle());
		System.out.printf("url of current page is %s\n", dr.getCurrentUrl());
		
		System.out.println("browser will be close");
		dr.quit();	
	}

}
