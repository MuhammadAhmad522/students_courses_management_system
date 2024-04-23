require 'csv'

class CSVReader
    def self.read_from_csv(filename, klass)
        data = []
        CSV.foreach(filename, headers: true) do |row|
            data << klass.from_a(row.to_a)
        end
        data
    end
end

class CSVWriter
    def self.write_to_csv(filename, data)
      CSV.open(filename, "w") do |csv|
        data.each do |item|
          csv << item.to_a
        end
      end
    end
  end