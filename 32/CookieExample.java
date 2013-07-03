import org.openqa.selenium.Cookie;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;


public class CookieExample {

	public static void main(String[] args) throws InterruptedException {
		WebDriver dr = new ChromeDriver();

		String url = "http://www.baidu.com";
		System.out.printf("now accesss %s \n", url);
		
		dr.get(url);
		Thread.sleep(2000);
		
		System.out.println(dr.manage().getCookies());
		
		dr.manage().deleteAllCookies();
		
		Cookie c1 = new Cookie("BAIDUID", "xxxxxxxxxx");
		Cookie c2 = new Cookie("BDUSS", "xxxxxxxxxx");
		dr.manage().addCookie(c1);
		dr.manage().addCookie(c2);
		
		System.out.println("browser will be close");
		
		dr.quit();	
	}

}
