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
* move_to。把鼠标移动到元素的中心点
* content_click。鼠标右键点击
* drag_and_drop。拖拽

代码
----
```
driver.action.key_down(:shift).
              click(element).
              click(second_element).
              key_up(:shift).
              drag_and_drop(element, third_element).
              perform
```

讨论
----
具体使用方法可以参考api文档。action的api文档算是比较全面了。
