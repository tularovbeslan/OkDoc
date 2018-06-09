//
//  BaseBubleCell.swift
//  OkDoc
//
//  Created by workmachine on 09.06.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit
import AsyncDisplayKit


protocol BubleDelegate: class {
	associatedtype ItemType: ASCellNode
	func didSelect(item: ItemType)
}

