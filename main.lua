-- width x height(800x600)
-- squares order → ↓ ← ↑
function love.load()
   squares = {}

   for i=1,18 do
      table.insert(squares, fib(i))
   end

   --love.window.maximize()
end

function love.draw()
   x = love.graphics.getWidth()/2
   y = love.graphics.getHeight()/2
   
   local direction = 1

   for i=1, #squares do
      love.graphics.setColor(1, 1, 1)

      if i == 1 then
	 love.graphics.rectangle("line", x, y, squares[i], squares[i])
      elseif direction == 1 then
	 x = x + squares[i-1]

	 love.graphics.rectangle("line", x, y, squares[i], squares[i])
	 direction = 2
      elseif direction == 2 then
	 x = x - squares[i-2]
	 y = y + squares[i-1]
	 direction = 3

	 love.graphics.rectangle("line", x, y, squares[i], squares[i])
      elseif direction == 3 then
	 x = x - squares[i]
	 y = y - squares[i-2]
	 direction = 4

	 love.graphics.rectangle("line", x, y, squares[i], squares[i])
      elseif direction == 4 then
	 y = y - squares[i]
	 direction = 1

	 love.graphics.rectangle("line", x, y, squares[i], squares[i])
      end

      drawLines(i, x, y, squares[i])
   end
end

function fib(n)
   if n == 0 then return 0 end
   local a,b = 1,1
   for k = 3,n do
      a, b = b, a+b
   end
   return b
end

function drawLines(mode, x1, y1, side)
   love.graphics.setColor(0,1,0)

   if mode%2 == 0 then
      love.graphics.line(x1, y1, x1+side, y1+side)
   else
      love.graphics.line(x1, y1+side, x1+side, y1)
   end
end
