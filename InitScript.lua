print("This is Lua init script (LUA_INIT)")
print(os.date("%Y-%m-%d %H:%M:%S"))

X = 42
Hello = "Hello World"

function fact(n)
  if (n == 0) then
    return 1
  else
    return n * fact(n - 1)
  end
end