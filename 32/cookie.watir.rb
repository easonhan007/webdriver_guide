#encoding: utf-8
require 'watir-webdriver'

b = Watir::Browser.new :chrome
url = 'www.baidu.com'
b.goto url

puts b.cookies.to_hash
dr.cookies.clear
dr.cookies.add('BAIDUID', 'xxxxxx')
dr.cookies.add('BDUSS', 'xxxxxx')

b.goto url

sleep(3)
b.close()

