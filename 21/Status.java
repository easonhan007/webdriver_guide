import java.io.File;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;


public class Status {

	public static void main(String[] args) throws InterruptedException {
		WebDriver dr = new ChromeDriver();
		
		File file = new File("src/status.html");
		String filePath = "file:///" + file.getAbsolutePath();
		System.out.printf("now accesss %s \n", filePath);
		
		dr.get(filePath);
		Thread.sleep(1000);	
		
		WebElement textField = dr.findElement(By.name("user"));
		System.out.println(textField.isEnabled());
		
//		直接用isEnabled方法去判断该button的话返回的会是true
//		这是因为button是使用css方法去disabled的，并不是真正的disable
//		这时候需要判断其class里是否有disabled这值来判断其是否处于disable状态
		System.out.println(dr.findElement(By.className("btn")).isEnabled());
		
//		隐藏掉textField
//		判断其是否显示
		((JavascriptExecutor)dr).executeScript("$(arguments[0]).hide()", textField);
		System.out.println(textField.isDisplayed());
		
//		使用click方法选择raido
		WebElement radio = dr.findElement(By.name("radio"));
		radio.click();
		System.out.println(radio.isSelected());
		
		try{
			dr.findElement(By.id("none"));
		} catch(NoSuchElementException e){
			System.out.println("element does not exist");
		}
		
		Thread.sleep(1000);
		System.out.println("browser will be close");
		dr.quit();	
	}

}
