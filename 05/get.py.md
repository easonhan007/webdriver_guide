访问链接
========

情景
----
web UI测试里最简单也是最基本的事情就是访问1个链接了。

在python的webdrive中，访问url时应该使用get方法。

代码
----

```python
from selenium import webdriver
import time

dr = webdriver.Chrome()

url = 'http://www.baidu.com'
print "now access %s" %(url)
dr.get(url)
time.sleep(3)

dr.quit()
```



