#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'upload_file.html'))
dr.get file_path

dr.find_element(name: 'file').send_keys('./upload_file.md')

sleep(2)
dr.quit()

