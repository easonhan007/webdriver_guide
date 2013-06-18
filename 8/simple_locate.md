简单的对象定位
--------------

场景
====
测试对象的定位和操作是webdriver的核心内容，其中操作又是建立在定位的基础之上,因此对象定位就越发显得重要了。

定位对象的目的一般有下面几种

* 操作对象
* 获得对象的属性，如获得测试对象的class属性，name属性等等
* 获得对象的text
* 获得对象的数量

webdriver提供了一系列的对象定位方法，常用的有以下几种

* id
* name
* class name
* link text
* partial link text
* tag name
* xpath
* css selector

代码
```
  require 'selenium-webdriver'

  dr = Selenium::WebDriver.for :chrome
  file_path = 'file:///' + File.expand_path(File.join('.', 'form.html'))
  puts file_path
  dr.get file_path

  # by id
  dr.find_element(:id, 'inputEmail').click

  # by name
  dr.find_element(:name, 'password').click

  # by tagname
  puts dr.find_element(:tag_name, 'form')[:class]

  # by class_name
  e = dr.find_element(:class, 'controls')
  dr.execute_script('$(arguments[0]).fadeOut().fadeIn()', e)
  sleep 1

  # by link text
  link = dr.find_element(:link_text, 'register')
  dr.execute_script('$(arguments[0]).fadeOut().fadeIn()', link)
  sleep 1

  # by partial link text
  link = dr.find_element(:partial_link_text, 'reg')
  dr.execute_script('$(arguments[0]).fadeOut().fadeIn()', link)
  sleep 1

  # by css selector
  div = dr.find_element(:css, '.controls')
  dr.execute_script('$(arguments[0]).fadeOut().fadeIn()', div)
  sleep 1

  # by xpath
  dr.find_element(:xpath, '/html/body/form/div[3]/div/label/input').click

  sleep 2
  dr.quit
```
