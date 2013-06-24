Remote Webdriver
================

场景
----
简单来说，我们可以把remote webdriver理解成在远程机器上运行webdriver脚本。

想像一下最简单的一个应用场景：你和你的同事两人一起开发一段webdriver脚本，然后你们需要在一个公共的环境去运行这段脚本。为什么要在公共的环境运行？那是因为每个人的开发机器是有差异的，但是如果用同一台测试机的话，那么环境差异的因素就可以基本排除。我们应该经常听到开发说这样的话:"这个bug在我的环境上是好的啊！"。因为运行环境不同而造成的bug比比皆是，因此我们需要一个统一的运行环境来消除差异。

在这样的应用场景下，我们就需要使用remote webdriver，我们在本地开发脚本，然后调用remote webdriver，在测试机器上执行我们的测试。

安装
----
Remote Webdriver的安装很简单。

首先下载[selenium-server-standalone-LAST-VERSION.jar](http://code.google.com/p/selenium/downloads/list)。

然后运行```java -jar selenium-server-standalone.jar```命令。如果没有错误出现的话，这台机器已经被配置成远程机器了，以后webdriver就会在这台机器上启动浏览器，执行脚本。

启动driver
-----------

下面的代码可以启动远程机器上的driver，默认情况下这会打开localhost也就是本机上的firefox浏览器

```
	driver = Selenium::WebDriver.for(:remote)
```

如果你的remote webdriver不在本地运行，而且你又想指定除firefox以外的浏览器，那么使用下面的代码
```
	driver = Selenium::WebDriver.for(:remote, :url => "http://myserver:4444/wd/hub", :desired_capabilities => :chrome)
```

通常情况下myserver可以是192.168.x.x之类的ip地址。

另外还可以通过配置```Selenium::WebDriver::Remote::Capabilities```来实现更加定制化的浏览器配置，这个超出本文范围，不做描述。

使用watir-webdriver启动driver
-----------------------------

可以使用下面的代码让watir-webdriver也使用remote webdriver模式
```
	browser = Watir::Browser.new(:remote, {desired_capabilities: :chrome, url: "http://myserver:4444/wd/hub"})
```


java版本
--------
```
	// We could use any driver for our tests...
	DesiredCapabilities capabilities = new DesiredCapabilities();

	// ... but only if it supports javascript
	capabilities.setJavascriptEnabled(true);

	// Get a handle to the driver. This will throw an exception
	// if a matching driver cannot be located
	WebDriver driver = new RemoteWebDriver(capabilities);

	// Query the driver to find out more information
	Capabilities actualCapabilities = ((RemoteWebDriver) driver).getCapabilities();

	// And now use it
	driver.get("http://www.google.com");
```

注意，java版本的代码我没有时间去调试，这里只是把wiki上的代码放出来而已。另外remote server在发生错误时会自动截图，下面是获得截图的代码
```
	public String extractScreenShot(WebDriverException e) {
		Throwable cause = e.getCause();
		if (cause instanceof ScreenshotException) {
			return ((ScreenshotException) cause).getBase64EncodedScreenshot();
		}
		return null;
	}
```	

python版本
----------
```
	c = webdriver.DesiredCapabilities.CHROME
	driver = webdriver.Remote(command_executor='http://127.0.0.1:4444/wd/hub', desired_capabilities=c)
```

注意，python binding的wiki中使用的启动remote webdriver的代码跟我上面给出的不太相同，可能是因为我的selenium版本较低(30)，最新版本的同学可以试试[wiki](http://code.google.com/p/selenium/wiki/PythonBindings)上的代码。


