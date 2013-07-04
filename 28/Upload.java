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
