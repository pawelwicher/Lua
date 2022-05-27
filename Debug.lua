print('hello')
x = 1+1
print(x)

for i = 1, 10 do 
	print("hello " .. tostring(i))
end

x = x * 2
print(x)

print(math.abs(-1))

print(_VERSION)

foo = 125

do
local foo = 123
print(foo)
end

do
local foo = 124
print(foo)
end

print(foo)

t = {10, 20, 30, 40, 50}
print(t[1])
print(#{10, 20, 30, 40, 50})

for i, v in ipairs(t) do	
	print(i .. " " .. v)
end


s = "hello123456"
print(#s)

x, y = 1,2
print(x)
print(y)
x, y = y, x
print(x)
print(y)

math.randomseed(os.time())
math.random()
print(math.random(100))

function test_func(arg)
	arg.a = arg.a + 1
	arg.b = arg.b + 1
	return arg.a, arg.b
end
print(test_func{a=77777, b = 88888})

function foo(x)
	a = 42
	return a + x
end
print()

print(foo(1))
print(a)

function f1( ... )
	local x,y,z = ...
	print(x,y,z)
end

f1(1,2,3,4,5)
print(z)

max = function(...)
	local t = {...}
	local m = ...
	for i = 1, #t do
		if m < t[i] then m = t[i] end
	end
	return m
end
print(max(1,2,33,4,5,6,7))

iter = function()
	local count = 0
	return function()
		count = count + 1
		if count == 10 then
			return nil,0,0
		else
			return count,0,0
		end
	end
end

for k,v,u in iter() do
	print(k,v,u)
end

t = {start = 10, endd = 50}
for k,v in pairs(t) do
	print(k,v)
end

dict = {Bob = 34, Alice = 23}
print(dict.Bob)

for k,v in pairs(dict) do
	print(k,v)
end

t = {}
t[1] = 789
t[2] = 8234
t[5] = 42334
for k,v in ipairs(t) do
	print(k,v)
end

print()

for k,v in pairs(t) do
	print(k,v)
end

print()

local meta = {}
local SS = {}

function SS.new(s)
	local t = {}
	t.s = s
	setmetatable(t, meta)
	return t
end
print(SS["new"])

function SS.add(s1, s2)
	return s1.s .. s2.s
end

meta.__add = SS.add

meta.__index = function(t, k) 
	if k == "len" then 
		return #t.s 
	elseif k == "reverse" then
		return string.reverse(t.s)
	end
end

a = SS.new('Bill ')
b = SS.new('Gates')

print(a + b)
print(a.len)
print(b.reverse)

test = function(x, y, ...)
	print(x, y, ...)
end
test(1, 2, 6767, 6546, 6435)

test1 = function(p)
	local p = p or 0
	local ppp = 333
	print(p)
end
test1()
test1(77)
print(ppp)

Car = { speed = 0, price = 0 }

function Car:speedUp(x)
	self.speed = self.speed + x
end

function Car:__tostring()
	return "Class Car"
end

function Car:new(t)
	t = t or {}
	setmetatable(t, self)
	self.__index = self
	return t
end

car = Car:new()
print(car.speed)

car = Car:new{speed = 120}
print(car.speed)
car:speedUp(15)
print(car.speed)
print(tostring(car))

function show(t)
	print(t.name)
end

show{name = 'bob'}

t1 = {1,2,3}
t2 = {44,55,66}
table.insert(t1, 333)
print(#t1)
print(table.concat(t1, ', '))
print(string.format("%s %s", "hello", "world"))

t = {22,33,44, foo = 'bar'}

print()
for i,v in ipairs(t) do print(i,v) end
print()
for k,v in pairs(t) do print(k,v) end


text = "hello"
print(text:match("l+"))
print(string.match(text, "[a-m]+"))
for w in string.gmatch("fizz buzz foo bar", "%a+") do
	print(w)
end

t = {
	123,
	x = 0,
	124,
	a = 1,
	b = 2,
	f = function(x) return x+1 end
}
for k,v in pairs(t) do print(k,v) end

print(t.f(5))

print(t[1])
print(t[2])
print(t[3])

print()
-- pattern matching
a, b = string.find('abc123dfg', '%d+')
print(a, b)
-- 4       6
a, b, c = string.match('abc123dfg', '(%a+)(%d+)(%a+)')
print(a, b, c)
--abc     123     dfg
s, _ = string.gsub('abc123dfg', '(%a+)(%d+)(%a+)', '%3%2%1')
print(s)
-- dfg123abc
s, c = string.gsub('abcdfg', '%a', 'x')
print(s, c)
-- xxxxxx  6

print()
-- date and time
currtime = os.time()
print(os.date('%Y-%m-%d', currtime))
-- 2019-12-05
tdate = os.date('*t', currtime)
print(tdate.day)
-- 5
tdate.day = tdate.day + 1
print(os.date('%Y-%m-%d', os.time(tdate)))
-- 2019-12-06

print()
print("EOF")