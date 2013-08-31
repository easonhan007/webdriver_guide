# -*- coding: utf-8 -*- 
from selenium import webdriver
from time import sleep
import os
if 'HTTP_PROXY'in os.environ: del os.environ['HTTP_PROXY']

dr = webdriver.Chrome()
url = 'http://www.baidu.com'
dr.get(url)

print "title of current page is %s" %(dr.title)
print "url of current page is %s" %(dr.current_url)

sleep(1)

dr.quit()
