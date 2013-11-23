require 'tempfile'

class SafeRuby
  def initialize(input)
    @input = "$SAFE=3; #{input}"
  end

  def self.run(code)
    new(code).run
  end

  def run
    Thread.new { eval(@input) }.value
  end

  # def run
  #   write_file = build_writefile
  #   read, write = IO.pipe
  #   ChildProcess.build("ruby", write_file.path).tap do |process|
  #     process.io.stdout = write
  #     process.io.stderr = write
  #     process.start
  #     process.wait
  #     write.close
  #   end

  #   p read.read
  # end

  # def build_writefile
  #   temp = Tempfile.new("enumtutor")
  #   temp.write("$SAFE=3;")
  #   temp.write(@input)
  #   temp.rewind
  #   temp
  # end
end

SafeRuby.run("puts [1,2,3].max")
