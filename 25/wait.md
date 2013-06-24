wait
====

场景
----
Wait类的使用场景是在页面上进行某些操作，然后页面上就会出现或隐藏一些元素，此时使用Wait类的until方法来等待这些效果完成以便进行后续的操作。另外页面加载时有可能会执行一些ajax，这时候也需要去Wait的until的等待ajax的请求执行完毕。

具体一点的例子前面也曾出现过，点击一个链接然后会出现一个下拉菜单，此时需要先等待下拉菜单出现方可进行点击菜单项的操作。

在实例化Wait类时，可以传入以下的一些参数

* timeout。总共等待多久,默认5s
* interval。每隔多久检查一次代码块里的值，默认0.2秒
* message。如果超时则显示message
* ignored。代码块中忽略的异常。也就是说如果代码块中抛出了这个异常，那么webdriver将忽略这个异常，继续进行等待，直到满足下面所列举的退出条件为止。默认情况下NoSuchElement异常是被忽略的。

until方法会一直等下去，直到

* 代码块中的内容为true(不为false或没有抛出异常)
* 超时,也就是超过了timeout设置的时间


代码
----
下面代码演示了点击按钮后如何等待label出现。这个例子其实没有前面的下拉菜单例子实用。
### wait.html

```
  <html>
    <head>
      <meta http-equiv="content-type" content="text/html;charset=utf-8" />
      <title>wait</title>		
      <script type="text/javascript" async="" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
      <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />		
      <script type="text/javascript">
        $(document).ready(function(){
            $('#btn').click(function(){
              $('<p><span class="label label-info">waitr-webdriver</span></p>').css('margin-top', '1em').insertAfter($(this));
              $(this).addClass('disabled').unbind('click');
            });
        });
      </script>
    </head>
      
    <body>
      <div class="row-fluid">
        <div class="span6 well">		
          <h3>wait</h3>
          <button class="btn btn-primary" id="btn" >Click</button>
        </div>		
      </div>		
    </body>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
  </html>
```

### wait.rb
```
  #encoding: utf-8
  require 'selenium-webdriver'

  dr = Selenium::WebDriver.for :chrome
  file_path = 'file:///' + File.expand_path(File.join('.', 'wait.html'))
  dr.get file_path

  # 点击按钮
  dr.find_element(:id, 'btn').click()

  wait = Selenium::WebDriver::Wait.new()
  wait.until { dr.find_element(class: 'label').displayed? }

  sleep(2)
  dr.quit()

```

