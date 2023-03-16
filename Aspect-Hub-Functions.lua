local AspectHubFunctions = {}

function AspectHubFunctions:GenerateRandomString(length)
    local chars = {}
    for i = 1, length do
        table.insert(chars, string.char(math.random(65, 90)))
        table.insert(chars, string.char(math.random(97, 122)))
    end
    return table.concat(chars)
end

return AspectHubFunctions
