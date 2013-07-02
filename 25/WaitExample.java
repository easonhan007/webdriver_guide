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


public class WaitExample {

	public static void main(String[] args) throws InterruptedException {
		WebDriver dr = new ChromeDriver();
		
		File file = new File("src/wait.html");
		String filePath = "file:///" + file.getAbsolutePath();
		System.out.printf("now accesss %s \n", filePath);
		
		dr.get(filePath);
		Thread.sleep(1000);
		
//		µã»÷°´Å¥
		dr.findElement(By.id("btn")).click();
		
		(new WebDriverWait(dr, 10)).until(new ExpectedCondition<Boolean>() {
				public Boolean apply(WebDriver d) {
                    return d.findElement(By.className("label")).isDisplayed();
                }
			});
						
		Thread.sleep(1000);
		System.out.println("browser will be close");
		dr.quit();	
	}

}
