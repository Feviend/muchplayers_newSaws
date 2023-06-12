require("./lib/std")

local big = {}
big.colorSpeed = 15
function big.start(saw)
    saw.color = red
    setProperty(saw.id, "t", 0)
end
function big.update(saw, delta)
    local t = getProperty(saw.id, "t")
    local size = saw.size
    saw.size = size + size * 0.2 * delta
    saw.color = lerpColor(red, black, t)
    t = t + big.colorSpeed * 0.01 * delta
    setProperty(saw.id, "t", t)
end

local bifurcation = {}
function bifurcation.start(saw)
    saw.color = violet
    setProperty(saw.id, "destroy", false)
end
function bifurcation.update(saw, delta)
    local x = saw.posX
    local y = saw.posY
    local cond = true
    local destCond = false
    local dirX = saw.dir.x
    local dest = getProperty(saw.id, "destroy")
    local border = 0.3
    if dirX ~= 0 then 
        cond = x > -border and x < border
        destCond = x > border or x < -border
    else
        cond = y > -border and y < border
        destCond = y > border or y < -border
    end
    if dest and destCond then
        saw.destroy()
    end
    if cond and dest == false then
        local saw1 = saw.clone(true)
        saw1.size = saw1.size * 0.75
        saw1.dir = vec2(1, 1)
        local saw2 = saw1.clone(true)
        if dirX ~= 0 then
            saw2.dir = vec2(1, -1)
        else
            saw2.dir = vec2(-1, 1)
        end
        setProperty(saw.id, "destroy", true)
    end
end

sawSpawner.newSawType(id, bifurcation.start, bifurcation.update, 25)
sawSpawner.newSawType(id, big.start, big.update, 15)
