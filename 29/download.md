下载
=====

场景
----
webdriver允许我们设置默认的文件下载路径。也就是说文件会自动下载并且存在设置的那个目录中。

下面会给出chrome和firefox浏览器的具体设置方法。

代码
-----

```
  # for chrome
  profile = Selenium::WebDriver::Chrome::Profile.new
  # 设置自动下载
  profile['download.prompt_for_download'] = false
  # 设置具体路径
  profile['download.default_directory'] = "/path/to/dir"

  driver = Selenium::WebDriver.for :chrome, :profile => profile

  # for firefox 
  profile = Selenium::WebDriver::Firefox::Profile.new

  profile['browser.download.dir'] = "/tmp/webdriver-downloads"
  profile['browser.download.folderList'] = 2
  # 设置哪些文件自动下载，这里设置的是pdf文件
  profile['browser.helperApps.neverAsk.saveToDisk'] = "application/pdf"

  driver = Selenium::WebDriver.for :firefox, :profile => profile

```
