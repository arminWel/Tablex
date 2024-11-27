local Table = {}
Table.__index = Table

setmetatable(Table, {
    __call = function(cls, ...)
        return cls.new(...)
    end,
})
warn("@on")

function Table.new(rows, cols)
    local self = setmetatable({}, Table)
    self._rows = rows
    self._cols = cols
    self.data = {}
    self.currentRow = 1
    self.currentCol = 1
    for i = 1, rows do
        self.data[i] = {}
        for j = 1, cols do
            self.data[i][j] = ""
        end
    end
    return self
end

function Table:export()
    local str = ""
    for _,row in ipairs(self.data) do
        str = str .. table.concat(row, "&") .. "\\\\\n"
    end
    return str
end

function Table:currentField()
    return self.data[self.currentRow][self.currentCol]
end

function Table:insertInCurrentField(value)
    self.data[self.currentRow][self.currentCol] = value
end

function Table:moveCursorRight(steps)
    steps = steps or 1
    if self.currentCol <= self._cols - steps then
        self.currentCol = self.currentCol + steps
    else
        self.currentCol = self._cols
        warn("Cannot move cursor right by " ..steps.. " (current column: " ..self.currentCol.. ", max column: " ..self._cols.. ")")
    end
end

function Table:moveCursorLeft(steps)
    steps = steps or 1
    if self.currentCol > steps then
        self.currentCol = self.currentCol - steps
    else
        self.currentCol = 1
        warn("Cannot move cursor left by " ..steps.. " (current column: " ..self.currentCol.. ", min column: 1)")
    end
end

function Table:moveCursorDown(steps)
    steps = steps or 1
    if self.currentRow <= self._rows - steps then
        self.currentRow = self.currentRow + steps
    else
        self.currentRow = self._rows
        warn("Cannot move cursor down by " ..steps.. " (current row: " ..self.currentRow.. ", max row: " ..self._rows.. ")")
    end
end

function Table:moveCursorUp(steps)
    steps = steps or 1
    if self.currentRow > steps then
        self.currentRow = self.currentRow - steps
    else
        self.currentRow = 1
        warn("Cannot move cursor up by " ..steps.. " (current row: " ..self.currentRow.. ", min row: 1)")
    end
end



return Table


