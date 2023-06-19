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