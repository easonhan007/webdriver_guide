安装python及webdriver的开发环境
==============================

场景
----
工欲善其事必先利其器，搭建开发环境对于初学者来说往往是非常困难和无从下手的。因此这里有必要叙述一下python及webdriver开发环境的搭建方法。

安装视频
-------
如果你对下面的文字不感兴趣，或者你对所有文字都不感兴趣，那么推荐你观看[这个视频](http://v.youku.com/v_show/id_XNjQ1MDI5Nzc2.html)

安装步骤
-------

首先感谢[active-python](http://www.activestate.com/activepython/)

只需要2步就可以安装完毕。

### 安装[active-python](http://www.activestate.com/activepython/)

从[这里](http://www.activestate.com/activepython/downloads)下载active python2.7.5的windows安装版本，注意，如果是64位系统，则需要选择(64-bit, x64)版本下载。

双击打开下载的文件，直接下一步安装既可，很简单,什么都不需要更改。

#### 注意，如果你的机器安装了360转坑小白伪杀毒工具的话，请关闭360再进行安装。

### 安装selenium webdriver

打开命令行cmd，输入下面的命令

	pip install selenium

回车后，你会看到下面的提示
	
	Downloading/unpacking selenium
		Downloading selenium-2.38.1.tar.gz (2.5MB): 2.5MB downloaded
		Running setup.py egg_info for package selenium

	Installing collected packages: selenium
		Running setup.py install for selenium

	Successfully installed selenium
	Cleaning up...

现在大功告成，python的webdriver之旅即将展开。


