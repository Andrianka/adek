WickedPdf.config = {
  #:wkhtmltopdf => '/usr/local/bin/wkhtmltopdf',
  #:layout => "pdf.html",
  #:exe_path => '/usr/local/bin/wkhtmltopdf',
  wkhtmltopdf_path: "<%= Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s %>"
}
