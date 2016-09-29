# -*- coding: utf-8 -*-
from selenium import webdriver
from selenium.webdriver.support.select import Select
from time import sleep
import os

dr = webdriver.Firefox()
file_path = 'file:///' + os.path.abspath('select.html')
dr.get(file_path)

phone_selector = Select(dr.find_element_by_tag_name('select'))

# 返回所有的options
print(phone_selector.options)
sleep(1)

# 返回所有选中的options
print(phone_selector.all_selected_options)
sleep(1)

# 通过option的value值来选择iphone 7
phone_selector.select_by_value('ip7')
sleep(2)

# 通过index来选择，比如选择第2项
phone_selector.select_by_index(1)
sleep(1)

# 通过option的text来选择
phone_selector.select_by_visible_text('iPhone 6s')


dr.quit()
