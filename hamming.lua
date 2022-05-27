local Hamming = {}

function Hamming.compute(a,b)
  local count = 0
  if #a == #b then
    for i = 1, #a do
      if string.sub(a, i, i) ~= string.sub(b, i, i) then
        count = count + 1
      end
    end
    return count
  else
    return -1
  end
end

return Hamming
