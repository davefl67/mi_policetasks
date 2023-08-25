TK = {}

TK.allowtasks = {
    wellness = true,            -- general check on ped
    missing = true,             -- search and rescue for ped
    resisting = true,           -- ped resisting arrest
    talkdown = true             -- talk ped down from situation
}

TK.wellness = {
    deadchance = true,          -- chance for ped to be dead on arrival
    aggression = {
        aftertalk = true,       -- chance for ped to be aggressive after talk
        onsight = true          -- chance for ped to be aggressive on arrival
    }
}