# -*- coding: utf-8 -*- 
from selenium import webdriver
from time import sleep
import os
if 'HTTP_PROXY'in os.environ: del os.environ['HTTP_PROXY']

dr = webdriver.Chrome()
file_path = 'file:///' + os.path.abspath('attribute.html')

dr.get(file_path)

link = dr.find_element_by_id('tooltip')

sleep(1)
# 获得tooltip的内容
print link.get_attribute('data-original-title')

# 获取该链接的text
print link.text

dr.quit()

