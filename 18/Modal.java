import java.io.File;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

public class Modal {

	public static void main(String[] args) throws InterruptedException {
		WebDriver dr = new ChromeDriver();
		
		File file = new File("src/modal.html");
		String filePath = "file:///" + file.getAbsolutePath();
		System.out.printf("now accesss %s \n", filePath);
		
		dr.get(filePath);
		Thread.sleep(1000);
		
//		打开对话框
		dr.findElement(By.id("show_modal")).click();
		
		(new WebDriverWait(dr, 10)).until(
				new ExpectedCondition<Boolean>() {
                    public Boolean apply(WebDriver d) {
                        return d.findElement(By.id("myModal")).isDisplayed();
                    }
                }
		);
		
//		 点击对话框中的链接
//		 由于对话框中的元素被蒙板所遮挡，直接点击会报 Element is not clickable的错误
//		 所以使用js来模拟click
//		 在watir-webdriver中只需要fire_event(:click)就可以了
		WebElement link = dr.findElement(By.id("myModal")).findElement(By.id("click"));
		((JavascriptExecutor)dr).executeScript("$(arguments[0]).click()", link);
		
		Thread.sleep(1000);
		System.out.println("browser will be close");
		dr.quit();	
	}
}
