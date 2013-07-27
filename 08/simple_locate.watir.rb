require 'watir-webdriver'

b = Watir::Browser.new :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'form.html'))

b.goto file_path

# by id
b.text_field(:id, 'inputEmail').click

# by name
b.text_field(:name, 'password').click

# by tagname
puts b.form().attribute_value(:class)

# by class_name
e = b.div(:class, 'controls')
b.execute_script('$(arguments[0]).fadeOut().fadeIn()', e)
sleep 1

# by link text
link = b.link(:text, 'register')
b.execute_script('$(arguments[0]).fadeOut().fadeIn()', link)
sleep 1

# by partial link text
link = b.link(:text, /reg/)
b.execute_script('$(arguments[0]).fadeOut().fadeIn()', link)
sleep 1

# by css selector
div = b.element(:css, '.controls')
b.execute_script('$(arguments[0]).fadeOut().fadeIn()', div)
sleep 1

sleep 2
b.close
