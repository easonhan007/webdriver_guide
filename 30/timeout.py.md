超时设置
=========

场景
----
webdriver中可以设置很多的超时时间

* implicit_wait。识别对象时的超时时间。过了这个时间如果对象还没找到的话就会抛出异常

代码
----

```
ff = webdriver.Firefox()
ff.implicitly_wait(10) # seconds
ff.get("http://somedomain/url_that_delays_loading")
myDynamicElement = ff.find_element_by_id("myDynamicElement")

```

