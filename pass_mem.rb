#!/usr/bin/env ruby
# encoding: UTF-8
# j, on 07-27-2013 
# ruby 2.0.0p247

require 'securerandom'
require 'colorize'
# helps you remember a password

	puts "enter your password "
	pass = gets.chomp
	pass = SecureRandom.base64(20).slice(0..11) if pass.empty?
system("clear")
pass_arr = pass.chars.each_slice(4).map(&:join)
p pass
`say -r110 -v Vick #{pass}`
sleep 2
system("clear")
pass_arr.each do |ele|
  `say -r110 -v Vick #{ele}`
  system("clear")
  ans = nil
  until ans == ele do
    p ele
    sleep 1.5
    system("clear")
    puts "type it! "
    ans = gets.chomp
    system("clear")
		unless ans == ele
			puts "try again".red
			sleep 1
			`say -r110 -v Vick #{ele}`
		end
	end
end
pas ||=nil
until pas == pass do
	p pass
	`say -r110 -v Vick #{pass}`
	sleep 1.5
	system("clear")
	puts "type it! "
	pas = gets.chomp
	system("clear")
	unless pas == pass
		puts "try again".red
		sleep 1
		`say -r110 -v Vick #{pass}`
		sleep 0.5
	end
end
