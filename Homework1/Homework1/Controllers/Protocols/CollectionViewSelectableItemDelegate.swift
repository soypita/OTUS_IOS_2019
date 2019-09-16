//
//  CollectionViewSelectableItemDelegate.swift
//  Homework1
//
//  Created by Дмитрий Сазонов on 16/09/2019.
//  Copyright © 2019 Дмитрий Сазонов. All rights reserved.
//

import UIKit

protocol CollectionViewSelectableItemDelegate: class, UICollectionViewDelegateFlowLayout {
    var didSelectItem: ((_ indexPath: IndexPath) -> Void)? { get set }
}
