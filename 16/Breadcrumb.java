import java.io.File;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;


public class Breadcrumb {

	public static void main(String[] args) throws InterruptedException {
		WebDriver dr = new ChromeDriver();
		
		File file = new File("src/breadcrumb.html");
		String filePath = "file:///" + file.getAbsolutePath();
		System.out.printf("now accesss %s \n", filePath);
		
		dr.get(filePath);
		Thread.sleep(1000);
		
//		获得其父层级
		List<WebElement> ancestors = dr.findElement(By.className("breadcrumb")).findElements(By.tagName("a"));
		for(WebElement link : ancestors){
			System.out.println(link.getText());
		}
		
//		获取当前层级
//		由于页面上可能有很多class为active的元素
//		所以使用层级定位最为保险
		WebElement current = dr.findElement(By.className("breadcrumb")).findElement(By.className("active"));
		System.out.println(current.getText());
		
		Thread.sleep(1000);
		System.out.println("browser will be close");
		dr.quit();	
	}

}
