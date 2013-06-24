#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'status.html'))
dr.get file_path

text_field = dr.find_element(:name, 'user')
puts text_field.enabled?

# 直接用enabled?方法去判断该button的话返回的会是true
# 这是因为button是使用css方法去disabled的，并不是真正的disable
# 这时候需要判断其class里是否有disabled这值来判断其是否处于disable状态
puts dr.find_element(:class, 'btn').enabled?

# 隐藏掉text_field
# 判断其是否显示
dr.execute_script('$(arguments[0]).hide()', text_field)
puts text_field.displayed?

# 使用click方法选择raido
radio = dr.find_element(name: 'radio')
radio.click()
puts radio.selected?

# 判断元素是否存在
begin
	dr.find_element(id: 'none')
rescue Selenium::WebDriver::Error::NoSuchElementError
	puts 'element does not exist'
end 

dr.quit()

