# The goal is to make github repo as ruby category
readme_line_count = File.foreach("README.md").inject(0) {|c, line| c+1}
fp = File.open("dummy.rb", "w")

(1..readme_line_count*2).each { |num| fp.puts("puts \"#{num}\"") }

fp.close
