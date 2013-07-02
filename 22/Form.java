import java.io.File;
import java.util.List;

import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;


public class Form {

	public static void main(String[] args) throws InterruptedException {
		WebDriver dr = new ChromeDriver();
		
		File file = new File("src/form.html");
		String filePath = "file:///" + file.getAbsolutePath();
		System.out.printf("now accesss %s \n", filePath);
		
		dr.get(filePath);
		Thread.sleep(1000);
		
//		选中checkbox
		dr.findElement(By.cssSelector("input[type=checkbox]")).click();
		Thread.sleep(1000);
		
//		选中radio
		dr.findElement(By.cssSelector("input[type=radio]")).click();
		Thread.sleep(1000);
		
//		选择下拉菜单中的最后一项
		List<WebElement> options = dr.findElement(By.tagName("select")).findElements(By.tagName("option"));
		options.get(options.size() - 1).click();
		Thread.sleep(1000);
		
//		点击提交按钮
		dr.findElement(By.cssSelector("input[type=submit]")).click();
		
		Alert alert = dr.switchTo().alert();
		System.out.println(alert.getText());
		alert.accept();
		
		Thread.sleep(1000);
		System.out.println("browser will be close");
		dr.quit();	
	}

}
