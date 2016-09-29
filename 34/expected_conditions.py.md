### 场景

Expected Conditions的使用场景有2种
* 直接在断言中使用
* 与WebDriverWait配合使用，动态等待页面上元素出现或者消失

### 方法注释

先翻译一下这些方法的用法

* ```title_is```: 判断当前页面的title是否精确等于预期

* ```title_contains```: 判断当前页面的title是否包含预期字符串

* ```presence_of_element_located```: 判断某个元素是否被加到了dom树里，并不代表该元素一定可见

* ```visibility_of_element_located```: 判断某个元素是否可见.**可见代表元素非隐藏，并且元素的宽和高都不等于0**

* ```visibility_of```: 跟上面的方法做一样的事情，只是上面的方法要传入locator，这个方法直接传定位到的element就好了

* ```presence_of_all_elements_located```: 判断是否至少有1个元素存在于dom树中。举个例子，如果页面上有n个元素的class都是'column-md-3'，那么只要有1个元素存在，这个方法就返回True

* ```text_to_be_present_in_element```: 判断某个元素中的text是否**包含**了预期的字符串

* ```text_to_be_present_in_element_value```: 判断某个元素中的value属性是否**包含**了预期的字符串

* ```frame_to_be_available_and_switch_to_it```: 判断该frame是否可以switch进去，如果可以的话，返回True并且switch进去，否则返回False


* ```invisibility_of_element_located```: 判断某个元素中是否不存在于dom树或不可见

* ```element_to_be_clickable```: 判断某个元素中是否可见并且是enable的，这样的话才叫clickable

* ```staleness_of```: 等某个元素从dom树中移除，注意，这个方法也是返回True或False

* ```element_to_be_selected```: 判断某个元素是否被选中了,一般用在下拉列表

* ```element_selection_state_to_be```: 判断某个元素的选中状态是否符合预期

* ```element_located_selection_state_to_be```: 跟上面的方法作用一样，只是上面的方法传入定位到的element，而这个方法传入locator

* ```alert_is_present```: 判断页面上是否存在alert，这是个老问题，很多同学会问到

### 具体的例子

例子的代码在[这里](https://gist.github.com/easonhan007/6dc544dc36367489c89f)，并且是可以运行通过的。

下面的代码演示了一些常见疑问

* 如何等待页面上的某个元素出现，然后再对这个元素进行操作
* 如何在unittest框架中所有的用例都共用1个浏览器实例，然后在全部用例结束后关闭浏览器

expected_conditions.py

```python
#encoding:utf-8
# example of how to use https://github.com/SeleniumHQ/selenium/blob/master/py/selenium/webdriver/support/expected_conditions.py

from selenium import webdriver
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.by import By

import unittest

# dr = webdriver.PhantomJS('phantomjs')
dr = webdriver.Firefox()
# dr = webdriver.Chrome()
url = 'http://www.baidu.com'
search_text_field_id = 'kw'
dr.get(url)

class ECExample(unittest.TestCase):

  def test_title_is(self):
    ''' 判断title是否符合预期 '''
    title_is_baidu = EC.title_is(u'百度一下，你就知道')
    self.assertTrue(title_is_baidu(dr))

  def test_titile_contains(self):
    ''' 判断title是否包含预期字符 '''
    title_should_contains_baidu = EC.title_contains(u'百度')
    self.assertTrue(title_should_contains_baidu(dr))

  def test_presence_of_element_located(self):
    ''' 判断element是否出现在dom树 '''
    locator = (By.ID, search_text_field_id)
    search_text_field_should_present = EC.visibility_of_element_located(locator)

    ''' 动态等待10s，如果10s内element加载完成则继续执行下面的代码，否则抛出异常 '''
    WebDriverWait(dr, 10).until(EC.presence_of_element_located(locator))
    WebDriverWait(dr, 10).until(EC.visibility_of_element_located(locator))

    self.assertTrue(search_text_field_should_present(dr))

  def test_visibility_of(self):
    search_text_field = dr.find_element_by_id(search_text_field_id)
    search_text_field_should_visible = EC.visibility_of(search_text_field)
    self.assertTrue(search_text_field_should_visible('yes'))

  def test_text_to_be_present_in_element(self):
    text_should_present = EC.text_to_be_present_in_element((By.NAME, 'tj_trhao123'), 'hao123')
    self.assertTrue(text_should_present(dr))


  @classmethod
  def tearDownClass(kls):
    print 'after all test'
    dr.quit()
    print 'quit dr'

if __name__ == '__main__':
  unittest.main()

```

### 分析
以title_is为例

```python
class title_is(object):
    """An expectation for checking the title of a page.
    title is the expected title, which must be an exact match
    returns True if the title matches, false otherwise."""
    def __init__(self, title):
        self.title = title

    def __call__(self, driver):
        return self.title == driver.title
```

可以看到```title_is```实际上是1个class，其```__call__```方法被定义成是返回1个bool值。因此，一般的用法就是

```python
# 实例化
the_instance = title_is('expected')
# 直接在实例上调用__call__
the_instance(dr) #return True or False
```
