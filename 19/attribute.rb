#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'attribute.html'))
dr.get file_path

link = dr.find_element(id: 'tooltip')

# 获得tooltip的内容
puts link.attribute('data-original-title')

# 获取该链接的text
puts link.text()

dr.quit()

