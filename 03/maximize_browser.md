浏览器最大化
============

场景
----
当我们在测试中使用一些基于图像和坐标的辅助测试工具时，我们就会需要使浏览器在每次测试时保存最大化，以便在同一分辨率下进行图像比对和坐标点选。

举例来说，如果在webdriver测试中使用了sikuli来对flash插件进行操作的话，把浏览器最大化无疑是一个比较简单的保证分辨率统一的解决方案。

代码
----
```
  require 'selenium-webdriver'

  dr = Selenium::WebDriver.for :chrome
  sleep 2
  puts 'maximize browser'
  dr.manage.window.maximize()
  sleep 2
  puts 'close browser'
  dr.quit
```


