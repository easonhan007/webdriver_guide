下载
=====

场景
----
webdriver允许我们设置默认的文件下载路径。也就是说文件会自动下载并且存在设置的那个目录中。

下面会给出firefox浏览器的具体设置方法。

代码
-----

```
  driver = Selenium::WebDriver.for :chrome, :profile => profile

  # for firefox 
  FirefoxProfile firefoxProfile = new FirefoxProfile();

  firefoxProfile.setPreference("browser.download.folderList",2);
  firefoxProfile.setPreference("browser.download.manager.showWhenStarting",false);
  firefoxProfile.setPreference("browser.download.dir","c:\\downloads");
  firefoxProfile.setPreference("browser.helperApps.neverAsk.saveToDisk","text/csv");

  WebDriver driver = new FirefoxDriver(firefoxProfile);
  //new RemoteWebDriver(new URL("http://localhost:4444/wd/hub"), capability);

  driver.navigate().to("http://www.myfile.com/hey.csv");

```
