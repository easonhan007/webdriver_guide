# -*- coding: utf-8 -*- 
from selenium import webdriver
from time import sleep
import os
if 'HTTP_PROXY'in os.environ: del os.environ['HTTP_PROXY']

dr = webdriver.Chrome()
file_path = 'file:///' + os.path.abspath('alert.html')
dr.get(file_path)

# 点击链接弹出alert
dr.find_element_by_id('tooltip').click()

try:
	alert = dr.switch_to_alert()
	alert.accept()
except:
	print 'no alerts display'

sleep(1)
dr.quit()

