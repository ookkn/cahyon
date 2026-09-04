	-- Produce a number between a/Start and b/End based on t/Rate, where t is in the range of 0, 1
return function(a: number, b: number, t: number): number

	return a + (b - a) * t
end