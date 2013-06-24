关闭浏览器
==========

场景
----
在脚本运行完毕或者测试代码结束的时候关闭浏览器是非常自然的事情，就像在吃完饭后就把餐桌收拾干净一样。

关闭浏览器有两种方式：

* close方法

* quit方法

close方法关闭当前的浏览器窗口，quit方法不仅关闭窗口，还会彻底的退出webdriver，释放与driver server之间的连接。所以简单来说quit是更加彻底的close，quit会更好的释放资源，适合强迫症和完美主义者。

代码
----
```
  require 'selenium-webdriver'

  dr = Selenium::WebDriver.for :chrome
  sleep 2
  puts 'browser will be closed'
  dr.quit() # or dr.close()
  puts 'browser is closed'
```
