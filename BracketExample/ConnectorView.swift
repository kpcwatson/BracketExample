//
//  ConnectorView.swift
//  BracketExample
//
//  Created by Kyle Watson on 6/16/20.
//  Copyright © 2020 Kyle Watson. All rights reserved.
//

import UIKit

class ConnectorView: UICollectionReusableView {
    static let reuseIdentifier = "connector-view-reuse-id"
    static let elementKind1 = "connector-kind-1"
    static let elementKind2 = "connector-kind-2"
    static let elementKind3 = "connector-kind-3"
    static let elementKind4 = "connector-kind-4"

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
