import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;


public class Maximize {

	public static void main(String[] args) throws InterruptedException {
		WebDriver dr = new ChromeDriver();
		Thread.sleep(2000);
		
		System.out.println("maximize browser");
		dr.manage().window().maximize();
		Thread.sleep(2000);
		
		System.out.println("browser will be close");
		dr.quit();	
	}

}
