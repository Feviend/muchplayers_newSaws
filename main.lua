require("./lib/std")
target = MIKORD
description = "Adds new saws (big and bifurcation saw) for Mikord"
description_sp = "Agrega nuevas sierras (sierra grande y de bifurcación) para Mikord"
description_ru = "Добавляет новые пилы (большую и раздваивающуюся) для Mikord"
description_fr = "Ajoute de nouvelles scies (grande scie et bifurcation) pour Mikord"
description_de = "Fügt neue Sägen (große Säge und Gabelsäge) für Mikord hinzu"

require("./big.lua")
require("./bifurcation.lua")

sawSpawner.newSawType(id, bifurcation.start, bifurcation.update, 25)
sawSpawner.newSawType(id, big.start, big.update, 15)