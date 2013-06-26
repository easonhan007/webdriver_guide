# -*- coding: utf-8 -*-
from selenium import webdriver
import time
import os

dr = webdriver.Chrome()
file_path =  'file:///' + os.path.abspath('operate_element.html')
dr.get(file_path)

# click
dr.find_element_by_link_text('Link1').click()
time.sleep(1)
dr.find_element_by_link_text('Link1').click()

# send_keys
element = dr.find_element_by_name('q')
element.send_keys('something')
time.sleep(1)

# clear
element.clear()
time.sleep(1)

dr.quit()

