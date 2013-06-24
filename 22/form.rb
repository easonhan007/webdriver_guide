#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'form.html'))
dr.get file_path

# 选中checkbox
dr.find_element(:css, 'input[type=checkbox]').click()
sleep(1)

# 选中radio
dr.find_element(:css, 'input[type=radio]').click()
sleep(1)

# 选择下拉菜单中的最后一项
dr.find_element(:tag_name, 'select').find_elements(:tag_name, 'option').last.click()
sleep(1)

# 点击提交按钮
dr.find_element(:css, 'input[type=submit]').click()
sleep(1)

alert = dr.switch_to.alert
puts alert.text
alert.accept()

dr.quit()

