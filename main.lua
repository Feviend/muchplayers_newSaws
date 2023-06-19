require("./lib/std")
target = MIKORD

require("./big.lua")
require("./bifurcation.lua")

sawSpawner.newSawType(id, bifurcation.start, bifurcation.update, 25)
sawSpawner.newSawType(id, big.start, big.update, 15)