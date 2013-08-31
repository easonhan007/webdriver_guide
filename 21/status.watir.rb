#encoding: utf-8
require 'watir-webdriver'

b = Watir::Browser.new :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'status.html'))

b.goto file_path

# watir没有enabled方法
# 不过可以element的private方法assert_enabled来判断元素的状态
text_field = b.text_field(:name, 'user')
begin
	text_field.send(:assert_enabled)
rescue
	puts 'element disabled'
end 

# 隐藏掉text_field
# 判断其是否显示
# watir 中使用visible方法
b.execute_script('$(arguments[0]).hide()', text_field)
puts text_field.visible?

# 使用click方法选择raido
radio = b.radio(name: 'radio')
radio.set()
puts radio.set?

# 判断元素是否存在 exists
# 判断元素是否存在且可见 present
puts b.text_field(:name, 'users').exists?
puts b.text_field(:name, 'users').present?


b.quit()

