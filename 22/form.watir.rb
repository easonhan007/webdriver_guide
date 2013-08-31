#encoding: utf-8
require 'watir-webdriver'

b = Watir::Browser.new :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'form.html'))

b.goto file_path

# watir中跟form元素相关的方法有
# checkbox
# radio
# text_field 
# text_area
# button(input submit or button)
# form 
# select

# 选中checkbox
b.checkbox.set true
sleep(1)

# 选中radio
b.radio.set 
sleep(1)

# 选择下拉菜单中的最后一项
b.select.options.last.click
sleep(1)

# 点击提交按钮
b.button.click
sleep(1)

alert = b.alert
puts alert.text
alert.ok()

b.close()

