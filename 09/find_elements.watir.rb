#encoding: utf-8
require 'watir-webdriver'

b = Watir::Browser.new :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'checkbox.html'))

b.goto file_path

# 选择所有的checkbox并全部勾上
#dr.find_elements(:css, 'input[type=checkbox]').each {|c| c.click}
b.checkboxes.each { |c| c.set(true) }
b.refresh
sleep 1

# 打印当前页面上有多少个checkbox
#puts dr.find_elements(:css, 'input[type=checkbox]').size
puts b.checkboxes.size

# 选择页面上所有的input，然后从中过滤出所有的checkbox并勾选之
# 在watir-webdriver中是不需要这样做的
=begin
dr.find_elements(:tag_name, 'input').each do |input|
	input.click if input.attribute(:type) == 'checkbox'
end 
sleep 1
=end

# 把页面上最后1个checkbox的勾给去掉
#dr.find_elements(:css, 'input[type=checkbox]').last.click
b.checkboxes.last.click

sleep 2
b.close
