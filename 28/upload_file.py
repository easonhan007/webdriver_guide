# -*- coding: utf-8 -*- 
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep
import os
if 'HTTP_PROXY'in os.environ: del os.environ['HTTP_PROXY']

dr = webdriver.Chrome()
file_path = 'file:///' + os.path.abspath('upload_file.html')

dr.get(file_path)

dr.find_element_by_name('file').send_keys('./upload_file.md')

sleep(2)
dr.quit()

