#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'pagination.html'))
dr.get file_path

# 获得所有分页的数量
# -2是因为要去掉上一个和下一个
total_pages = dr.find_element(:class, 'pagination').find_elements(:tag_name, 'li').size - 2
puts "total page is #{total_pages}"

# 获取当前页面的url以及当前页面是第几页
current_page = dr.find_element(:class, 'pagination').find_element(:class, 'active')
puts "current page is #{current_page.text}"
dr.quit()

