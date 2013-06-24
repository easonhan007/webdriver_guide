启动浏览器
==========

场景
----
在使用webdriver进行测试时启动浏览器无疑是必须的前置工作。

代码
----
```ruby
  require 'selenium-webdriver'
  # chrome
  dr = Selenium::WebDriver.for :chrome
  # firefox
  dr = Selenium::WebDriver.for :ff
  # ie
  dr = Selenium::WebDriver.for :ie
```


