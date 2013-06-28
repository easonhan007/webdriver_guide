import java.io.File;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;


public class Pagination {

	public static void main(String[] args) throws InterruptedException {
		WebDriver dr = new ChromeDriver();
		
		File file = new File("src/pagination.html");
		String filePath = "file:///" + file.getAbsolutePath();
		System.out.printf("now accesss %s \n", filePath);
		
		dr.get(filePath);
		Thread.sleep(1000);
		
//		获得所有分页的数量
//		-2是因为要去掉上一个和下一个
		int total_pages = dr.findElement(By.className("pagination")).findElements(By.tagName("li")).size() - 2;
		System.out.printf("Total page is %d\n", total_pages);
		
//		取当前页面的url以及当前页面是第几页
		WebElement current_page = dr.findElement(By.className("pagination")).findElement(By.className("active"));
		System.out.printf("Current page is %s\n", current_page.getText());
		
		Thread.sleep(1000);
		System.out.println("browser will be close");
		dr.quit();	
	}

}
