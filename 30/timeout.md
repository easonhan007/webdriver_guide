超时设置
=========

场景
----
webdriver中可以设置很多的超时时间

* implicit_wait。识别对象时的超时时间。过了这个时间如果对象还没找到的话就会抛出NoSuchElement异常
* script_timeout。异步脚本的超时时间。webdriver可以异步执行脚本，这个是设置异步执行脚本脚本返回结果的超时时间
* page_load。页面加载时的超时时间。因为webdriver会等页面加载完毕在进行后面的操作，所以如果页面在这个超时时间内没有加载完成，那么webdriver就会抛出异常

代码
----

```
  driver = Selenium::WebDriver.for :chrome
  # 定位对象时给3s的时间
  # 如果3s内还定位不到则抛出异常
  driver.manage.timeouts.implicit_wait = 3 # seconds

  # 页面加载超时时间设置为5s
  driver.manage.page_load = 5 #seconds

  # 异步脚本的超时时间设置成3s 
  driver.manage.script_timeout = 3 #seconds

```

讨论
----
由于webdriver是通过给driver发送http请求来进行每步操作的，因此就可以设置http请求的超时时间。默认ruby binding的http client超时时间是60s，你可以通过下面的代码来改变这一设置。

```
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 120 # seconds
  driver = Selenium::WebDriver.for(:chrome, :http_client => client)
```
