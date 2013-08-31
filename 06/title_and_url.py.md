打印当前页面的title及url
========================

情景
----
测试中，访问1个页面然后判断其title是否符合预期是很常见的1个用例，所谓用例不够，title来凑就是这个道理。更具体一点，假设1个页面的title应该是'hello world', 那么可以写这样的一个用例：访问该页面，获取该页面的title，判断获取的值是否等于'hello world'。

获取当前页面的url也是非常重要的一个操作。在某些情况下，你访问一个url，这时系统会自动对这个url进行跳转，这就是所谓的'重定向'。一般测试重定向的方法是访问这个url，然后等待页面重定向完毕之后，获取当前页面的url，判断该url是否符合预期。另外的一个常见的测试场景是提交了一个表单，如果表单内容通过了验证，那么则会跳转到一个新页面，如果未通过验证，则会停留在当前页面，此时获取当前页面的url则可以帮助我们判断表单提交的跳转是否符合预期。更具体一点，假如你在测试一个登陆页面，输入正确的登陆信息后，会跳转到系统首页。获取跳转后的url然后判断其是否与系统首页的url相符将是一个很不错的用例。

代码
----
```python
# -*- coding: utf-8 -*- 
from selenium import webdriver
from time import sleep
import os
if 'HTTP_PROXY'in os.environ: del os.environ['HTTP_PROXY']

dr = webdriver.Chrome()
url = 'http://www.baidu.com'
dr.get(url)

print "title of current page is %s" %(dr.title)
print "url of current page is %s" %(dr.current_url)

sleep(1)

dr.quit()

```
