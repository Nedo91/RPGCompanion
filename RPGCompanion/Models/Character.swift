//
//  Character.swift
//  RPGCompanion
//
//  Created by Nedeljko Mijajlovic on 14/01/2019.
//  Copyright © 2019 Nedeljko Mijajlovic. All rights reserved.
//

import Foundation

//var raceTypId: Int!
//var classTypeId: Int!
//var basementId: Int!


class Character {
    var id: Int?
    var strength: Int!
    var intelect: Int!
    var agility: Int!
    var stamina: Int!
    var gender: String!
    var age: Int!
    var race: String!
    var nick: String!
    var createDate: Date!
    var currentLevel: Int!

    public init(id: Int?, strength: Int!, intelect: Int!, agility: Int!, stamina: Int!, gender: String!, age: Int!, race: String!, nick: String!, createDate: Date!, currentLevel: Int!) {
        self.id = id
        self.strength = strength
        self.intelect = intelect
        self.agility = agility
        self.stamina = stamina
        self.gender = gender
        self.age = age
        self.race = race
        self.nick = nick
        self.createDate = createDate
        self.currentLevel = currentLevel
    }
}