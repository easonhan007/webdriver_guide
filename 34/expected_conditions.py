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
