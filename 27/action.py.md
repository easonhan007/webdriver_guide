action
=======

场景
----
由于webdriver是要模拟真实的用户操作，因此webdriver的Action类中提供了很多与操作有关的方法。

下面列举一下Action类的一些主要方法

* key_down。模拟按键按下
* key_up。模拟按键弹起
* click
* send_keys
* double_click。鼠标左键双击
* click_and_hold。鼠标左键点击住不放
* release。鼠标左键弹起，可以与click_and_hold配合使用
* move_to_element。把鼠标移动到元素的中心点
* content_click。鼠标右键点击
* drag_and_drop。拖拽


代码
----
```
from selenium.webdriver.common.action_chains import ActionChains

element = wd.find_element_by_link_text('xxxxx')
hov = ActionChains(wd).move_to_element(element)
hov.perform()
```

讨论
----
具体的api文档参考[这里](http://selenium-python.readthedocs.org/en/latest/api.html#module-selenium.webdriver.common.action_chains)
