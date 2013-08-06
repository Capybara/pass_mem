#!/usr/bin/env ruby
# encoding: UTF-8
# j, on 07-27-2013 
# ruby 2.0.0p247

require 'securerandom'
require 'colorize'
# set @pass to user input or generated password
def get_pass
	puts "enter your password "
	@pass = gets.chomp
	@pass = SecureRandom.base64(20).slice(0..11) if @pass.empty?
end

get_pass
p @pass
sleep 2
system('clear')

# split the pass into easier to remember sections
def break_up
	@pass_arr = @pass.chars.each_slice(4).map(&:join)
end
break_up

# say and print password or element
def say_write(word)
	p word	
	`say -r110 -v Vick #{word}`
end

def say_write_test(word,wrong=nil)
	if wrong
		puts "try again".on_red.white
	end
	p word	
	`say -r110 -v Vick #{word}`
end

def check_it(word)
	ans = nil
	until ans == word do
		say_write(word)
		sleep 1.5
		system("clear")
		puts "type it! "
		ans = gets.chomp
		system("clear")
		unless ans == word
			say_write_test(word,"wrong")
			sleep 1
		end
	end
end

@pass_arr.each do |ele|
	say_write(ele)
	system('clear')
	ans = nil
	check_it(ele)
end

@pass_arr.each do |word|
	say_write(word)
	sleep 1
	system('clear')
end
check_it(@pass)
