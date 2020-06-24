//
//  GameCell.swift
//  BracketExample
//
//  Created by Kyle Watson on 5/26/20.
//  Copyright © 2020 Kyle Watson. All rights reserved.
//

import UIKit

class GameCell: UICollectionViewCell {

    @IBOutlet weak var topSeed: UILabel!
    @IBOutlet weak var topName: UILabel!
    @IBOutlet weak var topScore: UILabel!

    @IBOutlet weak var bottomSeed: UILabel!
    @IBOutlet weak var bottomName: UILabel!
    @IBOutlet weak var bottomScore: UILabel!

    func configure(game: Game) {
        topSeed.text = String(game.homeTeam.seed)
        topName.text = game.homeTeam.name
        if let score = game.homeScore {
            topScore.text = String(score)
        } else {
            topScore.text = nil
        }

        bottomSeed.text = String(game.awayTeam.seed)
        bottomName.text = game.awayTeam.name
        if let score = game.awayScore {
            bottomScore.text = String(score)
        } else {
            bottomScore.text = nil
        }
    }
}
