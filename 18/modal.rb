#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'modal.html'))
dr.get file_path

# 打开对话框
dr.find_element(:id, 'show_modal').click

wait = Selenium::WebDriver::Wait.new(timeout: 10)
wait.until { dr.find_element(id: 'myModal').displayed? }

# 点击对话框中的链接
# 由于对话框中的元素被蒙板所遮挡，直接点击会报 Element is not clickable的错误
# 所以使用js来模拟click
# 在watir-webdriver中只需要fire_event(:click)就可以了
link = dr.find_element(id: 'myModal').find_element(id: 'click')
dr.execute_script('$(arguments[0]).click()', link)
sleep(2)

# 关闭对话框
dr.find_element(:class, 'modal-footer').find_elements(:tag_name, 'button').first.click

dr.quit()

