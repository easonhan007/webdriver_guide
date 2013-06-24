前进和后退
===========

场景
----
说实话，这两个功能一般不太常用。所能想到的场景大概也就是在几个页面间来回跳转，省去每次都get url。

代码
----

```
  require 'selenium-webdriver'

  dr = Selenium::WebDriver.for :chrome
  first_url = 'http://www.baidu.com'
  puts "now access #{first_url}"
  dr.get(first_url)
  sleep 1
  second_url = 'http://www.news.baidu.com'
  puts "now access #{second_url}"
  dr.get(second_url)
  sleep 1

  puts "back to #{first_url}"
  dr.navigate.back()
  sleep 1
  puts "forward to #{second_url}"
  dr.navigate.forward()
  sleep 1
  dr.quit()
```
