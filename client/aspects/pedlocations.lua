PL = {}

SetPedlocation = function()
    local location = nil
    location = PL.loc[math.random(1, #PL.loc)]
    return location
end

PL.loc = {

    [1] = {
        place = 'South Los Santos: Strawberry Mortuary 1',
        blip = vec3(396.025, -1528.592, 31.112),
        spawn = {
            [1] = vec4(399.638, -1531.158, 29.274, 235.136),
            [2] = vec4(385.396, -1504.974, 29.291, 7.72),
            [3] = vec4(426.416, -1496.060, 29.291, 304.822),
        }
    },

    [2] = {
        place = 'South Los Santos: Strawberry Mortuary 2',
        blip = vec3(396.025, -1528.592, 31.112),
        spawn = {
            [1] = vec4(399.638, -1531.158, 29.274, 235.136),
            [2] = vec4(385.396, -1504.974, 29.291, 7.72),
            [3] = vec4(426.416, -1496.060, 29.291, 304.822),
        }
    },

}