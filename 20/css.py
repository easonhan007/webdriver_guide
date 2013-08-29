# -*- coding: utf-8 -*- 
from selenium import webdriver
from time import sleep
import os
if 'HTTP_PROXY'in os.environ: del os.environ['HTTP_PROXY']

dr = webdriver.Chrome()
file_path = 'file:///' + os.path.abspath('css.html')

dr.get(file_path)

link = dr.find_element_by_id('tooltip')
print link.value_of_css_property('color')

print dr.find_element_by_tag_name('h3').value_of_css_property('font')

dr.quit()

