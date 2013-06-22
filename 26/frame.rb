#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'frame.html'))
dr.get file_path

# 先到f1再到f2
dr.switch_to.frame('f1')
dr.switch_to.frame('f2')
# 往f2中的百度关键字文本框中输入内容
dr.find_element(id: 'kw').send_keys 'watir-webdriver'

# 直接跳出所有frame
dr.switch_to.default_content

# 再到f1
dr.switch_to.frame('f1')
dr.find_element(link_text: 'click').click

sleep(2)
dr.quit()

