cookie
======

场景
-----
webdriver可以读取并添加cookie。有时候我们需要验证浏览器中是否存在某个cookie，因为基于真实的cookie的测试是无法通过白盒和集成测试完成的。

另外更加常见的一个场景是自动登陆。有很多系统的登陆信息都是保存在cookie里的，因此只要往cookie中添加正确的值就可以实现自动登陆了。什么图片验证码、登陆的用例就都是浮云了。

webdriver读写cookie的接口有以下一些

* add_cookie。添加cookie，必须有name, value这2个key
* delete_all_cookies。删除所有cookie
* all_cookies。返回所有的cookie
* delete_cookie(name)。删除name这个cookie
* cookie_named。返回特定name的cookie值


代码
----
下面的代码演示了如何自动登陆百度。其中敏感信息我使用了xxxx来代替。
### cookie.rb
```
  #encoding: utf-8
  require 'selenium-webdriver'

  dr = Selenium::WebDriver.for :chrome
  url = 'http://www.baidu.com'
  dr.get url

  p dr.manage.all_cookies
  dr.manage.delete_all_cookies
  dr.manage.add_cookie(name: 'BAIDUID', value: 'xxxxxx')
  dr.manage.add_cookie(name: 'BDUSS', value: 'xxxxxx')

  # 重新访问该页面就可以发现已经登陆了
  # 当然也可以刷新该页面
  dr.get url

  sleep(3)
  dr.quit()
```

