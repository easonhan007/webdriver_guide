# -*- coding: utf-8 -*- 
from selenium import webdriver
from time import sleep
import os
if 'HTTP_PROXY'in os.environ: del os.environ['HTTP_PROXY']

dr = webdriver.Chrome()
file_path = 'file:///' + os.path.abspath('status.html')
dr.get(file_path)

text_field = dr.find_element_by_name('user')
print text_field.is_enabled()

# 直接用enabled?方法去判断该button的话返回的会是true
# 这是因为button是使用css方法去disabled的，并不是真正的disable
# 这时候需要判断其class里是否有disabled这值来判断其是否处于disable状态
print dr.find_element_by_class_name('btn').is_enabled()

# 隐藏掉text_field
# 判断其是否显示
dr.execute_script('$(arguments[0]).hide()', text_field)
print text_field.is_displayed()

# 使用click方法选择raido
radio = dr.find_element_by_name('radio')
radio.click()
print radio.is_selected()

# 判断元素是否存在
try:
	dr.find_element_by_id('none')
except: 
	print 'element does not exist'

dr.quit()

