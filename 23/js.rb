#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'js.html'))
dr.get file_path

# 在页面上直接执行js
dr.execute_script('$("#tooltip").fadeOut();')
sleep(1)

# 在已经定位的元素上执行js
button = dr.find_element(class: 'btn')
dr.execute_script('$(arguments[0]).fadeOut()', button)
sleep(1)

dr.quit()

