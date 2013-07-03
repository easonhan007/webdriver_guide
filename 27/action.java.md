action
=======

场景
----
由于webdriver是要模拟真实的用户操作，因此webdriver的Action类中提供了很多与操作有关的方法。

下面列举一下Action类的一些主要方法

* keyDown。模拟按键按下
* keyUp。模拟按键弹起
* click
* sendKeys
* doubleClick。鼠标左键双击
* clickAndHold。鼠标左键点击住不放
* release。鼠标左键弹起，可以与click_and_hold配合使用
* moveToElement。把鼠标移动到元素的中心点
* contextClick。鼠标右键点击
* dragAndDrop。拖拽

代码
----
```
Actions action = new Actions(driver)
action.keyDown(Keys.SHIFT).
              click(element).
              click(second_element).
              keyUp(Keys.SHIFT).
              dragAndDrop(element, third_element).
							build().
              perform()
```

讨论
----
具体使用方法可以参考api文档。action的api文档算是比较全面了。
