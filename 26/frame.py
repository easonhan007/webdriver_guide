# -*- coding: utf-8 -*- 
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep
import os
import selenium.webdriver.support.ui as ui
if 'HTTP_PROXY'in os.environ: del os.environ['HTTP_PROXY']

dr = webdriver.Chrome()
file_path = 'file:///' + os.path.abspath('frame.html')

dr.get(file_path)

# 先到f1再到f2
dr.switch_to_frame('f1')
dr.switch_to_frame('f2')

# 往f2中的百度关键字文本框中输入内容
dr.find_element_by_id('kw').send_keys('watir-webdriver')

# 直接跳出所有frame
dr.switch_to_default_content()

# 再到f1
dr.switch_to_frame('f1')
dr.find_element_by_link_text('click').click()

sleep(2)
dr.quit()

