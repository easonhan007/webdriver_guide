定位frame中的元素
=================

场景
----
处理frame需要用到2个方法，分别是switch_to_frame(name_or_id_or_frame_element)和switch_to_default_content()

如何理解这个switch_to_frame(name_or_id_or_frame_element)方法呢？可以简单记忆一下，如果这个frame有name和id属性那么就用这两个属性就好，如果没有的话可以先用find_element_by_xxx方法找到这个frame元素，然后把这个元素传进去，这也是可行的。

switch_to_frame方法把当前定位的主体切换了frame里。怎么理解这句话呢？我们可以从frame的实质去理解。frame中实际上是嵌入了另一个页面，而webdriver每次只能在一个页面识别，因此才需要用switch_to_frame方法去获取frame中嵌入的页面，对那个页面里的元素进行定位。

switch_to_default_content方法的话则是从frame中嵌入的页面里跳出，跳回到最外面的原始页面中。

如果页面上只有1个frame的话那么这一切都是很好理解的，但如果页面上有多个frame，情况有稍微有点复杂了。

代码
----
下面的代码中frame.html里有个id为f1的frame，而f1中又嵌入了id为f2的frame，该frame加载了百度的首页。

### frame.html
```
  <html>
    <head>
      <meta http-equiv="content-type" content="text/html;charset=utf-8" />
      <title>frame</title>		
      <script type="text/javascript" async="" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
      <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" />		
      <script type="text/javascript">
        $(document).ready(function(){
        });
      </script>
    </head>
      
    <body>
      <div class="row-fluid">
        <div class="span10 well">		
          <h3>frame</h3>
          <iframe id="f1" src="inner.html" width="800", height="600"></iframe>
        </div>		
      </div>		
    </body>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
  </html>
```

### inner.html
```
  <html>
    <head>
      <meta http-equiv="content-type" content="text/html;charset=utf-8" />
      <title>inner</title>		
    </head>
      
    <body>
      <div class="row-fluid">
        <div class="span6 well">		
          <h3>inner</h3>
          <iframe id="f2" src="http://www.baidu.com" width="700" height="500"></iframe>
          <a href="javascript:alert('watir-webdriver better than selenium webdriver;')">click</a>
        </div>		
      </div>		
    </body>
  </html>
```

### frame.py
```
# -*- coding: utf-8 -*- 
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep
import os
import selenium.webdriver.support.ui as ui
if 'HTTP_PROXY'in os.environ: del os.environ['HTTP_PROXY']

dr = webdriver.Chrome()
file_path = 'file:///' + os.path.abspath('frame.html')

dr.get(file_path)

# 先到f1再到f2
dr.switch_to_frame('f1')
dr.switch_to_frame('f2')

# 往f2中的百度关键字文本框中输入内容
dr.find_element_by_id('kw').send_keys('watir-webdriver')

# 直接跳出所有frame
dr.switch_to_default_content()

# 再到f1
dr.switch_to_frame('f1')
dr.find_element_by_link_text('click').click()

sleep(2)
dr.quit()

```
讨论
----
假设页面上有A、B两个frame，其中B在A内，那么定位B中的内容则需要先到A，然后再到B。如果是定位A中的内容，那么直接switch_to_frame('A')就可以了;

switch_to.frame的参数问题。官方说name是可以的，但是经过实验发现id也可以。所以只要frame中id和name，那么处理起来是比较容易的。如果frame没有这两个属性的话，你可以直接加上，这对整个页面影响不大;

页面中使用frame会影响页面渲染速度，如果你遇到页面中有多个frame的情况，你完全可以提出1个页面前端性能的缺陷;

如果实在搞不定页面上的frame，送你一句歌词：也许放弃才能靠近你。那么及时放弃跟此frame相关的用例才是明智之举;
