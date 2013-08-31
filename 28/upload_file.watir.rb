#encoding: utf-8
require 'watir-webdriver'

b = Watir::Browser.new :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'upload_file.html'))

b.goto file_path

b.file_field.set('./upload_file.md')

sleep(2)
b.quit()

