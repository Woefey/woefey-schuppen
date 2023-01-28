Config = {}

Config.DetectTime = math.random(6000, 10000) 

Config.CommonChance = 70

Config.RareChance = 95

Config.CommonAmount = math.random(1,5) 

Config.RareAmount = 0 

Config.OverheatChance = 0 

Config.OverheatTime = math.random(500, 600) 

-- list of common items detectable
Config.CommonItems = {
    'metalscrap',
    'plastic',
    'copper',
    'iron',
    'aluminum',
    'steel',
    'glass',
    'cryptostick',
    'leeggoed_lp1',
    'leeggoed_lp2',
    'leeggoed_lp3',
    'leeggoed_lp4',
    'leeggoed_lg1',
    'leeggoed_lg2',
    'leeggoed_lg3',
    'leeggoed_lg4',
    'leeggoed_lg5',
}

-- list of rare items detectable
Config.RareItems = {
    'metalscrap',
    'plastic',
    'copper',
    'iron',
    'aluminum',
    'steel',
    'glass',
    'cryptostick',
    'leeggoed_lp1',
    'leeggoed_lp2',
    'leeggoed_lp3',
    'leeggoed_lp4',
    'leeggoed_lg1',
    'leeggoed_lg2',
    'leeggoed_lg3',
    'leeggoed_lg4',
    'leeggoed_lg5',
}

-- Schup zones
Config.DetectZones = {
    [1] = {
        label = "Kand van de weg",
        zones = {
            vector4(1085.38, 530.99, 95.22, 211.93),
            vector4(1073.38, 523.15, 94.95, 203.6),
            vector4(1085.74, 504.08, 94.61, 311.47),
            vector4(1114.64, 507.34, 93.93, 60.47),
            vector4(1127.34, 528.95, 95.3, 115.87)
        },
    },
}

