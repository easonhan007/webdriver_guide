#encoding: utf-8
require 'watir-webdriver'

b = Watir::Browser.new :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'attribute.html'))

b.goto file_path

link = b.link(id: 'tooltip')

# 获得tooltip的内容
puts link.attribute_value('data-original-title')

# 获取该链接的text
puts link.text()

b.close
