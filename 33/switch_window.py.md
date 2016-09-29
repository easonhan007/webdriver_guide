## 切换窗口

### 场景

切换窗口的场景其实很普遍，当你点击了一个链接之后有可能弹出一个新窗口，这时候如果你需要定位新窗口中的元素并进行操作，你就需要进行窗口切换的操作。

### 代码

switch_window.html

```html
<html>
	<head>
		<title>Switch Window</title>
	</head>

	<body>
		<h3>This is main window</h3>
		<a id="open-new-window" href="sub_window.html" target="_blank">Click to open sub window</a>
	</body>
</html>
```

sub_window.html

```html
<html>
	<head>
		<title>Sub Window</title>
	</head>

	<body>
		<h3>This is sub window</h3>
	</body>
</html>
```

switch_window.py

```python

# coding: utf-8

from selenium import webdriver
from time import sleep
import os

# I write this code on my MBP and I can not launch chrome using chrome driver
# use firefox instead
dr = webdriver.Firefox()
file_path = 'file:///' + os.path.abspath('switch_window.html')

dr.get(file_path)
print dr.title
print dr.find_element_by_tag_name('h3').text

open_new_win_link = dr.find_element_by_id('open-new-window')
open_new_win_link.click()

# find all window handles
all_handles = dr.window_handles

# find handle of the other window
the_other_handle = ''
for h in all_handles:
	if h != dr.current_window_handle: the_other_handle = h

#switch window
if the_other_handle:
	dr.switch_to_window(the_other_handle)
	print dr.title
	print dr.find_element_by_tag_name('h3').text
	assert dr.title == 'Sub Window'

dr.quit

```

### 思考

切换到新打开窗口的思路实际上就是遍历所有的窗口句柄，如果不是当前窗口的话就切换到这个句柄所代表的窗口。

那么问题就来了，上面的代码其实有点问题，你能找到这个问题吗?
