$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))
require "Parser"
require "PHPCreater"

code = <<-EOF
phpinfo
exit
EOF

parser = Parser.new
parsed_code = parser.parse code
creater = PHPCreater.new(parsed_code)
p creater.create