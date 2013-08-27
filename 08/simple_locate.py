from selenium import webdriver
from time import sleep
import os
if 'HTTP_PROXY'in os.environ: del os.environ['HTTP_PROXY']

dr = webdriver.Chrome()
file_path = 'file:///' + os.path.abspath('form.html')
print file_path

dr.get(file_path)

# by id
dr.find_element_by_id('inputEmail').click()

# by name
dr.find_element_by_name('password').click()

# by tagname
print dr.find_element_by_tag_name('form').get_attribute('class')

# by class_name
e = dr.find_element_by_class_name('controls')
dr.execute_script('$(arguments[0]).fadeOut().fadeIn()', e)
sleep(1)

# by link text
link = dr.find_element_by_link_text('register')
dr.execute_script('$(arguments[0]).fadeOut().fadeIn()', link)
sleep(1)

# by partial link text
link = dr.find_element_by_partial_link_text('reg')
dr.execute_script('$(arguments[0]).fadeOut().fadeIn()', link)
sleep(1)

# by css selector
div = dr.find_element_by_css_selector('.controls')
dr.execute_script('$(arguments[0]).fadeOut().fadeIn()', div)
sleep(1)

# by xpath
dr.find_element_by_xpath('/html/body/form/div[3]/div/label/input').click()

sleep(2)
dr.quit()

