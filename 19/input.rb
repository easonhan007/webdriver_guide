#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'input.html'))
dr.get file_path

text_field = dr.find_element(class: 'well').find_element(:css, 'input[type=text]')
puts text_field.attribute('id')
puts text_field.attribute('name')
puts text_field.attribute('class')
puts text_field.attribute('value')

dr.quit()

