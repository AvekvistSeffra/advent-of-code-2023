local utils = {}

function utils.open_file(path)
	io.input(path)
	file = io.read("*all")
	return utils.split_lines(file)
end

function utils.split_lines(str)
	lines = {}
	for s in file:gmatch("[^\r\n]+") do
		table.insert(lines, s)
	end
	return lines
end

return utils
