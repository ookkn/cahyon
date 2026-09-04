-- You need to gather all your lua connections and pass a method for disconnecting them, then it is called and it clears the array.
return function(connections: { any  }, disconnectMethod: ( any ) -> ())
	for _, connection in connections do
		disconnectMethod(connection)
	end
	table.clear(connections)
end
