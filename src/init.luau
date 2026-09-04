local pkg = {}

if not script:WaitForChild("util", 10) or not script:WaitForChild("math", 10) or not script:WaitForChild("events", 10) then
    error("[Cahyon] [Cahyon/init] Failed to load required packages. [utils, math, events] are required. One or more was not found.")
    return nil
end

pkg.utils = script:WaitForChild("util")
pkg.math = script:WaitForChild("math")
pkg.events = script:WaitForChild("events")

if not pkg.utils or not pkg.math or not pkg.events then
    error("[Cahyon] [Cahyon/init] Failed to load required packages. [utils, math, events] are required. One or more was not found.")
    return nil
end
return pkg