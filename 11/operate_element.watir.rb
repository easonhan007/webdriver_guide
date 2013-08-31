#encoding: utf-8
require 'watir-webdriver'

b = Watir::Browser.new :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'operate_element.html'))

b.goto file_path
#click
b.link(:text, 'Link1').click
sleep(1)
b.link(:text, 'Link1').click

#set
element = b.text_field(:name, 'q')
element.set 'waitr-webdriver'
sleep(1)

#clear
element.clear

sleep(2)
b.close

