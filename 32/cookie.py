# -*- coding: utf-8 -*- 
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep
import os
if 'HTTP_PROXY'in os.environ: del os.environ['HTTP_PROXY']

dr = webdriver.Chrome()

url = 'http://www.baidu.com'
dr.get(url)

print dr.get_cookies()
dr.delete_all_cookies()
dr.add_cookie({'name': 'BAIDUID', 'value': 'xxxxxx'})
dr.add_cookie({'name': 'BDUSS', 'value': 'xxxxxx'})

dr.get(url)

sleep(3)
dr.quit()

