//
//  Games.swift
//  BracketExample
//
//  Created by Kyle Watson on 5/26/20.
//  Copyright © 2020 Kyle Watson. All rights reserved.
//

import Foundation

struct Game: Hashable {
    let homeTeam: Team
    let homeScore: Int?
    let awayTeam: Team
    let awayScore: Int?
    let isFinal: Bool
}

let g201 = Game(homeTeam: duke, homeScore: 78, awayTeam: ndakota, awayScore: 67, isFinal: true)
let g202 = Game(homeTeam: vcu, homeScore: 82, awayTeam: ucf, awayScore: 67, isFinal: true)
let g203 = Game(homeTeam: missst, homeScore: 82, awayTeam: liberty, awayScore: 67, isFinal: true)
let g204 = Game(homeTeam: vt, homeScore: 71, awayTeam: stlouis, awayScore: 67, isFinal: true)
let g205 = Game(homeTeam: maryland, homeScore: 71, awayTeam: belmont, awayScore: 67, isFinal: true)
let g206 = Game(homeTeam: lsu, homeScore: 71, awayTeam: yale, awayScore: 67, isFinal: true)
let g207 = Game(homeTeam: louis, homeScore: 82, awayTeam: minn, awayScore: 67, isFinal: true)
let g208 = Game(homeTeam: michstate, homeScore: 71, awayTeam: bradley, awayScore: 67, isFinal: true)

let g301 = Game(homeTeam: duke, homeScore: 88, awayTeam: ucf, awayScore: 84, isFinal: true)
let g302 = Game(homeTeam: liberty, homeScore: 56, awayTeam: vt, awayScore: 72, isFinal: true)
let g303 = Game(homeTeam: maryland, homeScore: 78, awayTeam: lsu, awayScore: 79, isFinal: true)
let g304 = Game(homeTeam: minn, homeScore: 56, awayTeam: michstate, awayScore: 72, isFinal: true)

let g401 = Game(homeTeam: duke, homeScore: nil, awayTeam: vt, awayScore: nil, isFinal: false)
let g402 = Game(homeTeam: lsu, homeScore: nil, awayTeam: michstate, awayScore: nil, isFinal: false)

let g501 = Game(homeTeam: duke, homeScore: nil, awayTeam: lsu, awayScore: nil, isFinal: false)

let allGames = [
    g201, g202, g203, g204, g205, g206, g207, g208,
    g301, g302, g303, g304,
    g401, g402,
    g501
]
