cookie
======

场景
-----
webdriver可以读取并添加cookie。有时候我们需要验证浏览器中是否存在某个cookie，因为基于真实的cookie的测试是无法通过白盒和集成测试完成的。

另外更加常见的一个场景是自动登陆。有很多系统的登陆信息都是保存在cookie里的，因此只要往cookie中添加正确的值就可以实现自动登陆了。什么图片验证码、登陆的用例就都是浮云了。



代码
----
下面的代码演示了如何自动登陆百度。其中敏感信息我使用了xxxx来代替。
### cookie.py
```
# -*- coding: utf-8 -*- 
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep
import os
if 'HTTP_PROXY'in os.environ: del os.environ['HTTP_PROXY']

dr = webdriver.Chrome()

url = 'http://www.baidu.com'
dr.get(url)

print dr.get_cookies()
dr.delete_all_cookies()
dr.add_cookie({'name': 'BAIDUID', 'value': 'xxxxxx'})
dr.add_cookie({'name': 'BDUSS', 'value': 'xxxxxx'})

dr.get(url)

sleep(3)
dr.quit()

```

