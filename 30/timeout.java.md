超时设置
=========

场景
----
webdriver中可以设置很多的超时时间

* implicitlyWait。识别对象时的超时时间。过了这个时间如果对象还没找到的话就会抛出NoSuchElement异常
* setScriptTimeout。异步脚本的超时时间。webdriver可以异步执行脚本，这个是设置异步执行脚本脚本返回结果的超时时间
* pageLoadTimeout。页面加载时的超时时间。因为webdriver会等页面加载完毕在进行后面的操作，所以如果页面在这个超时时间内没有加载完成，那么webdriver就会抛出异常

代码
----

```
  # 定位对象时给3s的时间
  # 如果3s内还定位不到则抛出异常
  driver.manage().timeouts().implicitlyWait(3, TimeUnit.SECONDS);

  # 页面加载超时时间设置为5s
  dr.manage().timeouts().pageLoadTimeout(5, TimeUnit.SECONDS);

  # 异步脚本的超时时间设置成3s 
  dr.manage().timeouts().setScriptTimeout(3, TimeUnit.SECONDS);

```

