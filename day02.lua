#!/opt/homebrew/bin/lua

local utils = require("utils")

local function test_game(id, red, green, blue)
	game = {}
	game.id = id
	game.red = red
	game.green = green
	game.blue = blue
	return game
end

local function parse_game(str)
	return test_game(1, 5, 4, 9)
end

local function day02()
	lines = utils.open_file("inputs/day02")
	sum = 0
	
	print(sum)
end

local function tests()
	games = {
		"Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green",
		"Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue",
		"Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red",
		"Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red",
		"Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green",
	}
	
	test_game1 = test_game(1, 5, 4, 9)
	assert(utils.equals(parse_game(games[1]), test_game1), "failed test 1")

	test_game2 = test_game(2, 1, 6, 6)
	assert(utils.equals(parse_game(games[2]), test_game2), "failed test 2")

	test_game3 = test_game(3, 25, 26, 11)
	assert(utils.equals(parse_game(games[3]), test_game3), "failed test 3")

	test_game4 = test_game(4, 23, 7, 21)
	assert(utils.equals(parse_game(games[4]), test_game4), "failed test 4")

	test_game5 = test_game(5, 7, 5, 3)
	assert(utils.equals(parse_game(games[5]), test_game5), "failed test 5")
end

tests()
day02()
