#!/opt/homebrew/bin/lua

local utils = require("utils")

local function get_word_value(value, start)
	if string.sub(value, start, start+2) == "one" then return 1, 1
	elseif string.sub(value, start, start+2) == "two" then return 2, 1
	elseif string.sub(value, start, start+4) == "three" then return 3, 3
	elseif string.sub(value, start, start+3) == "four" then return 4, 2
	elseif string.sub(value, start, start+3) == "five" then return 5, 2
	elseif string.sub(value, start, start+2) == "six" then return 6, 1
	elseif string.sub(value, start, start+4) == "seven" then return 7, 3
	elseif string.sub(value, start, start+4) == "eight" then return 8, 3
	elseif string.sub(value, start, start+3) == "nine" then return 9, 2
	else return nil, 0
	end
end

local function preprocess_values(value)
	processed = ""
	local i = 1
	while i <= #value do
		local temp, offset = get_word_value(value, i)
		if temp then processed = processed .. temp
		else processed = processed .. string.sub(value, i, i)
		end
		i = i + 1 + offset
	end
	return processed
end

local function calibration_value(value)
	value = preprocess_values(value)
	local eulav = string.reverse(value)
	local first = nil
	local last = nil

	for i=1,#value do
		first = tonumber(string.sub(value, i, i))
		if first then
			break
		end
	end

	for i=1,#eulav do
		last = tonumber(string.sub(eulav, i, i))
		if last then
			break
		end
	end

	return first .. last
end

local function day1()
	lines = utils.open_file("inputs/day01.data")
	sum = 0
	
	for i,v in ipairs(lines) do
		sum = sum + tonumber(calibration_value(v))
	end

	print(sum)
end

local function test_table(table)
	sum = 0
	for i,v in ipairs(table) do
		sum = sum + calibration_value(v)
	end
	return sum
end

local function tests()
	assert(calibration_value("1abc2") == "12", "test 1 failed")
	assert(calibration_value("pqr3stu8vwx") == "38", "test 2 failed")
	assert(calibration_value("a1b2c3d4e5f") == "15", "test 3 failed")
	assert(calibration_value("treb7uchet") == "77", "test 4 failed")
	assert(test_table({ "1abc2", "pqr3stu8vwx", "a1b2c3d4e5f", "treb7uchet", }) == 142, "table test 1 failed")
	assert(calibration_value("two1nine") == "29", "test 5 failed")
	assert(calibration_value("eightwothree") == "83", "test 6 failed")
	assert(calibration_value("abcone2threexyz") == "13", "test 7 failed")
	assert(calibration_value("xtwone3four") == "24", "test 8 failed")
	assert(calibration_value("4nineeightseven2") == "42", "test 9 failed")
	assert(calibration_value("zoneight234") == "14", "test 10 failed")
	assert(calibration_value("7pqrstsixteen") == "76", "test 11 failed")
	assert(test_table({ "two1nine", "eightwothree", "abcone2threexyz", "xtwone3four", "4nineeightseven2", "zoneight234", "7pqrstsixteen", }) == 281, "table test 2 failed")
end

tests()
day1()
