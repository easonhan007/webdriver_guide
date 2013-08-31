前进和后退
===========

场景
----
说实话，这两个功能一般不太常用。所能想到的场景大概也就是在几个页面间来回跳转，省去每次都get url。

代码
----

```python
from selenium import webdriver
from time import sleep
import os
if 'HTTP_PROXY'in os.environ: del os.environ['HTTP_PROXY']

dr = webdriver.Chrome()

first_url = 'http://www.baidu.com'
print "now access %s" %(first_url)

dr.get(first_url)
sleep(1)
second_url = 'http://www.news.baidu.com'
print "now access %s" %(second_url)
dr.get(second_url)
sleep(1)

print "back to %s" %(first_url)
dr.back()
sleep(1)
print "forward to %s" %(second_url)
dr.forward()
sleep(1)
dr.quit()
```
