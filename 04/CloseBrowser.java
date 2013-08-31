import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;


public class ResizeBrowser {

	public static void main(String[] args) {
		WebDriver dr = new ChromeDriver();
		dr.manage().window().setSize(new Dimension(240, 320));
		dr.get("http://www.3g.qq.com/");
		dr.quit();
	}

}
