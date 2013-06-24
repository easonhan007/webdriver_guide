#encoding: utf-8
require 'pdfkit'

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

md = File.join('..', '**', '*.md')
md_files = Dir.glob(md)

all_in_one = 'all_in_one.md'
md_files.each_with_index do |md, index|
	File.open(all_in_one, 'a+') do |handle|
		File.open(md, 'r') do |f|
			handle.write('-' * 20) if index != 0
			20.times { handle.puts '' } if index != 0
			handle.write(f.read) 
		end #File.open
	end
end
all_in_one_html = 'all_in_one.html'

File.open(all_in_one_html, 'w') do 
	|f| f.write '<html>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=utf-8" />
		<title>Book</title>		
	</head>
	<body>'
end 
system("mdt #{all_in_one} >> #{all_in_one_html}")
File.open(all_in_one_html, 'a+') { |f| f.write'</body></html>'}

html = File.open(all_in_one_html, 'r') { |f| f.read }
kit = PDFKit.new(html)
kit.stylesheets << './style.css'
kit.to_file('book.pdf')
File.delete(all_in_one)
File.delete(all_in_one_html)
