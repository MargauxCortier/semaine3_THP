class JsonScrapper
  att_accessor :hash, :file

  def initialize(in_hash, in_file)
    @hash = in_hash
    @file = in_file
  end

  def json
    file.open(@file, "w") do |f|
      f.write(@hash.to_json)
    end
  end
end
