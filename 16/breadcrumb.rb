#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'breadcrumb.html'))
dr.get file_path

# 获得其父层级
anstors = dr.find_element(:class, 'breadcrumb').find_elements(:tag_name, 'a').map { |link| link.text }
p anstors
sleep(1)

# 获取当前层级
# 由于页面上可能有很多class为active的元素
# 所以使用层级定位最为保险
puts dr.find_element(:class, 'breadcrumb').find_element(:class, 'active').text

dr.quit()

