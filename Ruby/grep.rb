#! /usr/bin/ruby1.9.1
# -*- coding: UTF-8 -*-

if ARGV.length < 2
    puts 'Usage: ./grep.rb <regex> <filename>'
end

def color(s)
    "\033[1;33m#{s}\033[0m"
end

begin
    regex = Regexp.new(ARGV[0...ARGV.length-1].join ' ')
rescue RegexpError => e
    puts e.message
    exit 1
end

filename = ARGV[-1]

unless File.exists? filename
    puts "#{filename} is not a valid filename."
    exit 2
end

File.open filename do |f|
    while line = f.gets
        print line.gsub(regex) { |m| color(m) }
    end
end
