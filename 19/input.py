# -*- coding: utf-8 -*- 
from selenium import webdriver
from time import sleep
import os
import selenium.webdriver.support.ui as ui
if 'HTTP_PROXY'in os.environ: del os.environ['HTTP_PROXY']

dr = webdriver.Chrome()
file_path = 'file:///' + os.path.abspath('input.html')

dr.get(file_path)

text_field = dr.find_element_by_class_name('well').find_element_by_css_selector('input[type=text]')

print text_field.get_attribute('id')
print text_field.get_attribute('name')
print text_field.get_attribute('class')
print text_field.get_attribute('value')

dr.quit()

