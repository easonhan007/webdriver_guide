require 'pdfkit'
require 'redcarpet'

PDFKit.configure do |config|
  config.wkhtmltopdf = 'D:\wkhtmltopdf\wkhtmltopdf.exe'
  config.default_options = {
    :page_size => 'Letter',
    :print_media_type => true
  }
  # config.root_url = "http://localhost" # Use only if your external hostname is unavailable on the server.
end

md = File.join('..', '**', '*.md')
md_files = Dir.glob(md)

md_files.each do |md|
	File.open('all_in_one.md', 'a+') do |handle|
		File.open(md, 'r') {|f| handle.write(f.read) }
	end
end

html = File.open('all_in_one.html', 'r') { |f| f.read }
kit = PDFKit.new(html)
kit.stylesheets << 'bootstrap.min.css'
kit.stylesheets << 'bootstrap-responsive.min.css'

kit.to_file('book.pdf')
