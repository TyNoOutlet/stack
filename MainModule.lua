-- // METADATA
-- // Author: Ty_Scripts
-- // First Edition: 7/6/2021 10:30AM EST
-- // Name: Stack
-- // Description: Allows simple stack implementation in Lua.

local stack  = {}

function stack.new(overflow, overflowAmt)
	local newStack
	if overflow then
		newStack = {
			["limit"] = overflowAmt;
			["top"] = 0;
			["items"] = {}
		}
	else
		newStack = {
			["top"] = 0;
			["items"] = {}
		}
	end
	return newStack
end

function stack.push(item, value)
	if item["limit"] ~= nil then
		if item["top"] == item["limit"] then
			error("Stack | Stack overflow error. Stack limits have been reached.")
		else
			item["top"] += 1
			item["items"][item["top"]] = value
		end
	else
		item["top"] += 1
		item["items"][item["top"]] = value
	end
end

function stack.pop(item)
	if item["top"] == 0 then
		error("Stack | Stack underflow error. There must be elements in the stack to pop.")
	else
		local toPop = item["items"][item["top"]]
		table.remove(item, item["top"])
		item["top"] -= 1
		return toPop
	end
end

return stack
