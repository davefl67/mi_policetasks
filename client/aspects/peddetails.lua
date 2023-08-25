PD = {}

SetPedName = function(chance)
    local name, gender = nil, nil
    if chance == 0 then
        gender = PD.name.female
        name = gender[math.random(1, #gender)]
        if Debug then
            print('gender found: 0')
        end
    else
        gender = PD.name.male
        name = gender[math.random(1, #gender)]
        if Debug then
            print('gender found: 1')
        end
    end
    return name
end

SetPedDetails = function(chance)
    local ped, gender = nil, nil
    if chance == 0 then
        gender = PD.ped.female
        ped = gender[math.random(1, #gender)]
        if Debug then
            print('details found: 0')
        end
    else
        gender = PD.ped.male
        ped = gender[math.random(1, #gender)]
        if Debug then
            print('details found: 1')
        end
    end
    return ped
end

PD.name = {
    male = {
        [1] = 'Lennon Abbott', [2] = 'Shaun Higgins', [3] = 'Lucas Everett', [4] = 'Ralph Rangel',
        [5] = 'Vinnie Duncan', [6] = 'Harry Taylor', [7] = 'Mehmet Garcia', [8] = 'Ronan Fischer',
        [9] = 'Henry Stokes', [10] = 'Terry Mata', [11] = 'Joseph Garcia', [12] = 'Hector Lucas',
        [13] = 'Dominic Rojas', [14] = 'Bernard O\'Moore', [15] = 'Robbie Roach', [16] = 'Mack Williams',
        [17] = 'Lenard Squabble', [18] = 'Noel Mcgrath', [19] = 'Ibraheem Cobb', [20] = 'Max Carey',
    },

    female = {
        [1] = 'Caitlyn Hunt', [2] = 'Mary Farmer', [3] = 'Zoe Stevens', [4] = 'Teresa Hodge',
        [5] = 'Josie Wells', [6] = 'Isha Mcgowan', [7] = 'Anaya Ballard', [8] = 'Jasmin Padilla',
        [9] = 'Anaya Ballard', [10] = 'Miriam Robles', [11] = 'Poppy Lloyd', [12] = 'Darcy Lynch',
        [13] = 'Yasin Mack', [14] = 'Izabella Hess', [15] = 'Angel Haley', [16] = 'Alicia Reyes',
        [17] = 'Aleesha Randall', [18] = 'Claudia Clay', [19] = 'Alison Morales', [20] = 'Julie Montes',
    }
}

PD.ped = { -- random peds for idle tasks
    male = {
        [1] = { model = 'a_m_m_beach_01', 
        dscpt = 'male | afro-amercian | bald',
        img = 'nui://mi_police_tasks/web/peds/a_m_m_beach_01.png' },

        [2] = { model = 'a_m_m_golfer_01',
        dscpt = 'male | caucasian | bald',
        img = 'nui://mi_police_tasks/web/peds/a_m_m_golfer_01.png' },

        [3] = { model = 'a_m_m_ktown_01',
        dscpt = 'male | asian | dark hair',
        img = 'nui://mi_police_tasks/web/peds/a_m_m_ktown_01.png' },

        [4] = { model = 'a_m_m_polynesian_01',
        dscpt = 'male | asian | dark hair',
        img = 'nui://mi_police_tasks/web/peds/a_m_m_polynesian_01.png' },
        
        [5] = { model = 'a_m_o_genstreet_01',
        dscpt = 'male | caucasian | bald',
        img = 'nui://mi_police_tasks/web/peds/a_m_o_genstreet_01.png' },

        [6] = { model = 'a_m_o_soucent_01',
        dscpt = 'male | afro-amercian | dark hair',
        img = 'nui://mi_police_tasks/web/peds/a_m_o_soucent_01.png' },

        [7] = { model = 'a_m_y_beach_01',
        dscpt = 'male | caucasian | bald',
        img = 'nui://mi_police_tasks/web/peds/a_m_y_beach_01.png' },

        [8] = { model = 'a_m_y_busicas_01',
        dscpt = 'male | caucasian | blonde hair',
        img = 'nui://mi_police_tasks/web/peds/a_m_y_busicas_01.png' },

        [9] = { model = 'a_m_y_mexthug_01',
        dscpt = 'male | hispanic | bald',
        img = 'nui://mi_police_tasks/web/peds/a_m_y_mexthug_01.png' },

        [10] = { model = 'a_m_y_stlat_01',
        dscpt = 'male | hispanic | dark hair',
        img = 'nui://mi_police_tasks/web/peds/a_m_y_stlat_01.png' },

        [11] = { model = 'g_m_m_mexboss_01',
        dscpt = 'male | hispanic | dark hair',
        img = 'nui://mi_police_tasks/web/peds/g_m_m_mexboss_01.png' },

        [12] = { model = 'g_m_y_lost_03',
        dscpt = 'male | caucasian | bald',
        img = 'nui://mi_police_tasks/web/peds/g_m_y_lost_03.png' },

        [13] = { model = 's_m_m_dockwork_01',
        dscpt = 'male | caucasian | dark hair',
        img = 'nui://mi_police_tasks/web/peds/s_m_m_dockwork_01.png' },

        [14] = { model = 's_m_m_hairdress_01',
        dscpt = 'male | afro-amercian | dark hair',
        img = 'nui://mi_police_tasks/web/peds/s_m_m_hairdress_01.png' },

        [15] = { model = 's_m_m_pilot_01',
        dscpt = 'male | caucasian | grgey hair',
        img = 'nui://mi_police_tasks/web/peds/s_m_m_pilot_01.png' },
    },

    female = {
        [1] = { model = 'a_f_m_bevhills_01',
        dscpt = 'female | caucasian | dark hair',
        img = 'nui://mi_police_tasks/web/peds/a_f_m_bevhills_01.png' },

        [2] = { model = 'a_f_m_ktown_01',
        dscpt = 'female | asian | dark hair',
        img = 'nui://mi_police_tasks/web/peds/a_f_m_ktown_01.png' },

        [3] = { model = 'a_f_m_eastsa_02',
        dscpt = 'female | hispanic | dark hair',
        img = 'nui://mi_police_tasks/web/img/peds/a_f_m_eastsa_02.png' },

        [4] = { model = 'a_f_m_fatbla_01',
        dscpt = 'female | afro-amercian | dark hair',
        img = 'nui://mi_police_tasks/web/peds/a_f_m_fatbla_01.png' },

        [5] = { model = 'a_f_o_indian_01',
        dscpt = 'female | indian | dark hair',
        img = 'nui://mi_police_tasks/web/peds/a_f_o_indian_01.png' },

        [6] = { model = 'a_f_m_fatwhite_01',
        dscpt = 'female | caucasian | blone hair',
        img = 'nui://mi_police_tasks/web/peds/a_f_m_fatwhite_01.png' },

        [7] = { model = 'a_f_o_ktown_01',
        dscpt = 'female | asian | white hair',
        img = 'nui://mi_police_tasks/web/peds/a_f_o_ktown_01.png' },

        [8] = { model = 'a_f_y_eastsa_03',
        dscpt = 'female | hispanic | dark hair',
        img = 'nui://mi_police_tasks/web/peds/a_f_y_eastsa_03.png' },

        [9] = { model = 'a_f_y_indian_01',
        dscpt = 'female | indian | dark hair',
        img = 'nui://mi_police_tasks/web/peds/a_f_y_indian_01.png' },
        
        [10] = { model = 'a_f_o_salton_01',
        dscpt = 'female | caucasian | blone hair',
        img = 'nui://mi_police_tasks/web/peds/a_f_o_salton_01.png' },

        [11] = { model = 'a_f_y_vinewood_02',
        dscpt = 'female | caucasian | dark hair',
        img = 'nui://mi_police_tasks/web/peds/a_f_y_vinewood_02.png' },

        [12] = { model = 'g_f_y_vagos_01',
        dscpt = 'female | hispanic | dark hair',
        img = 'nui://mi_police_tasks/web/img/peds/g_f_y_vagos_01.png' },
        
        [13] = { model = 'mp_f_chbar_01',
        dscpt = 'female | caucasian | dark hair',
        img = 'nui://mi_police_tasks/web/peds/mp_f_chbar_01.png' },

        [14] = { model = 's_f_y_hooker_02',
        dscpt = 'female | caucasian | blone hair',
        img = 'nui://mi_police_tasks/web/peds/s_f_y_hooker_02.png' },

        [15] = { model = 'a_f_y_soucent_01',
        dscpt = 'female | afro-amercian | dark hair',
        img = 'nui://mi_police_tasks/web/peds/a_f_y_soucent_01.png' },
    }
}