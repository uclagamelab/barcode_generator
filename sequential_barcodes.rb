require "prawn"

FONT = File.expand_path(File.dirname(__FILE__)) + "/FRE3OF9X.TTF"

pdf = Prawn::Document.new(margin: 0)

start_x = col_width = 21.6
document_height = 790
label_width = 126
label_height = 36
start_y = document_height - label_height
start_num = ARGV[0].to_i

20.times do |i|
  4.times do |j|
    pdf.bounding_box([ start_x + ((col_width + label_width) * j), start_y - (label_height * i)], width: label_width, height: label_height) do
      pdf.move_down 2
      pdf.font FONT, size: 24
      pdf.text "*%06d*" % start_num, align: :center
      pdf.move_down 1
      pdf.font "Courier", size: 12
      pdf.text "%06d" % start_num, align: :center
      start_num += 1
    end
  end
end

pdf.render_file "barcodes.pdf"
