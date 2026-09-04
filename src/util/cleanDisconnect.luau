-- You need to gather all your connections and pass them to disconnect them all and clear the array.
return function(RBXConnections: { RBXScriptConnection })
	for _, connection in RBXConnections do
		connection:Disconnect()
	end
	table.clear(RBXConnections)
end
