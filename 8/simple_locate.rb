require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'form.html'))
puts file_path
dr.get file_path

# by id
dr.find_element(:id, 'inputEmail').click

# by name
dr.find_element(:name, 'password').click

# by tagname
puts dr.find_element(:tag_name, 'form')[:class]

# by class_name
e = dr.find_element(:class, 'controls')
dr.execute_script('$(arguments[0]).fadeOut().fadeIn()', e)

sleep 5
dr.quit

