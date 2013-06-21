#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'css.html'))
dr.get file_path

link = dr.find_element(id: 'tooltip')
puts link.css_value(:color)

puts dr.find_element(:tag_name, 'h3').css_value('font')

dr.quit()

