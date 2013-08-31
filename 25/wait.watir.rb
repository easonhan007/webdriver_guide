#encoding: utf-8
require 'watir-webdriver'

b = Watir::Browser.new :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'wait.html'))

b.goto file_path

# 点击按钮
b.button(:id, 'btn').when_present.click()

b.span(:class,'label').wait_until_present

sleep(2)
b.close()

