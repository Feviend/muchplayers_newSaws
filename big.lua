local big = {}
big.colorSpeed = 15

---@param saw Saw
function big.start(saw)
    saw.color = red
    saw.setProperty("t", 0)
end

---@param saw Saw
function big.update(saw, delta)
    local t = saw.getProperty("t")
    local size = saw.size
    saw.size = size + size * 0.2 * delta
    saw.color = lerpColor(red, black, t)
    t = t + big.colorSpeed * 0.01 * delta
    saw.setProperty("t", t)
end