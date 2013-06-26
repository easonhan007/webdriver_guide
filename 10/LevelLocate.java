import java.io.File;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;


public class LevelLocate {

	public static void main(String[] args) throws InterruptedException {
		WebDriver dr = new ChromeDriver();
		
		File file = new File("src/level_locate.html");
		String filePath = "file:///" + file.getAbsolutePath();
		System.out.printf("now accesss %s \n", filePath);
		
		dr.get(filePath);
		Thread.sleep(1000);
		
		dr.findElement(By.linkText("Link1")).click();
		
		(new WebDriverWait(dr, 10)).until(new ExpectedCondition<Boolean>(){
			public Boolean apply(WebDriver d){
				return d.findElement(By.id("dropdown1")).isDisplayed();
			}
		} );
		
		WebElement menu = dr.findElement(By.id("dropdown1")).findElement(By.linkText("Another action"));
		(new Actions(dr)).moveToElement(menu).perform();
		
		Thread.sleep(1000);
		System.out.println("browser will be close");
		dr.quit();	
	}

}
