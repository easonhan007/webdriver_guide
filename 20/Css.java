import java.io.File;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;


public class Css {

	public static void main(String[] args) throws InterruptedException {
		WebDriver dr = new ChromeDriver();
		
		File file = new File("src/css.html");
		String filePath = "file:///" + file.getAbsolutePath();
		System.out.printf("now accesss %s \n", filePath);
		
		dr.get(filePath);
		Thread.sleep(1000);
		
		WebElement link = dr.findElement(By.id("tooltip"));
		
		System.out.println(link.getCssValue("color"));
		
		System.out.println(dr.findElement(By.tagName("h3")).getCssValue("font"));
		
		Thread.sleep(1000);
		System.out.println("browser will be close");
		dr.quit();	
	}

}
