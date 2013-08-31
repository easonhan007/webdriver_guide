#encoding: utf-8
require 'watir-webdriver'

b = Watir::Browser.new :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'frame.html'))

b.goto file_path


# 往f2中的百度关键字文本框中输入内容
b.frame(:id, 'f1').frame(:id, 'f2').text_field(id: 'kw').set 'watir-webdriver'

# 再到f1
b.frame(:id, 'f1').link(text: 'click').click

sleep(2)
b.quit()

