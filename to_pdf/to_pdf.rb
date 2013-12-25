#encoding: utf-8
#require 'pdfkit'
=begin
PDFKit.configure do |config|
 # config.wkhtmltopdf = 'D:\wkhtmltopdf\wkhtmltopdf.exe'
  config.default_options = {
    # :page_size => 'Letter',
    :print_media_type => true,
	:no_background => true,
	:encoding => 'utf-8',
	
  }
  # config.root_url = "http://localhost" # Use only if your external hostname is unavailable on the server.
end
=end
md = File.join('..', '**', '*.md')
#md = File.join('..', '**', '*.java.md')
#md = File.join('..', '**', '*.py.md')
md_files = Dir.glob(md)

#all_in_one = 'webdriver_java.md'
all_in_one = 'webdriver_ruby.md'
#all_in_one = 'webdriver_python.md'

md_files.each_with_index do |md, index|
	File.open(all_in_one, 'a+') do |handle|
		File.open(md, 'r') do |f|
			if index != 0 
				handle.puts ''
				handle.write('-' * 20)
				handle.puts ''
			end #if
			handle.write(f.read) 
		end #File.open
	end
end
#all_in_one_html = 'all_in_one.html'
#all_in_one_html = 'all_in_one.java.html'

#system("mdt #{all_in_one} >> #{all_in_one_html}")

=begin
html = File.open(all_in_one_html, 'r') { |f| f.read }
kit = PDFKit.new(html)
kit.stylesheets << './style.css'
kit.to_file('book.pdf')
File.delete(all_in_one)
File.delete(all_in_one_html)
=end
