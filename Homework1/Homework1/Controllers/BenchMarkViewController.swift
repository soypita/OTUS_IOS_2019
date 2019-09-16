//
//  BenchMarkViewController.swift
//  Homework1
//
//  Created by Дмитрий Сазонов on 05/09/2019.
//  Copyright © 2019 Дмитрий Сазонов. All rights reserved.
//

import UIKit

class BenchMarkViewController: UIViewController {
    private let reuseIdentifier = "customCellId"
    private let reuseIdForStackCell = "cellWithStack"
    var timers: [TimerState] = []
    var layout: CollectionViewSelectableItemDelegate?
    
    var columnLayout: CollectionViewSelectableItemDelegate {
        let res = ColumnLayoutDelegate()
        res.didSelectItem = self.selectCell
        return res
    }
    
    var tableLayout: CollectionViewSelectableItemDelegate {
        let res = TableLayoutDelegate()
        res.didSelectItem = self.selectCell
        return res
    }
    
    func selectCell(_ indexPath: IndexPath) {
        if indexPath.row != self.timers.count {
               timers[indexPath.row].changeTimerState()
           }
    }
    
    var isTableLayout = false {
        didSet {
            if isTableLayout {
               layout = tableLayout
            } else {
               layout = columnLayout
            }
        }
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var componentsFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBehaviors(behaviors: [TimerControllerBehavior()])
        
        for _ in 1...10 {
            timers.append(TimerState())
        }
        layout = columnLayout
        updateLayoutFlow()
    }
    
    private func updateLayoutFlow() {
        collectionView.delegate = layout
        collectionView.performBatchUpdates({
            collectionView.reloadData()
        }, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        for timerItem in timers {
            timerItem.resetTimer()
        }
        self.collectionView?.reloadData()
    }
    
    @IBAction func changeLayout(_ sender: Any) {
        isTableLayout.toggle()
        updateLayoutFlow()
    }
}

extension BenchMarkViewController {
    @objc func runScheduledTask(_ runningTimer: Timer) {
        timers[runningTimer.userInfo as! Int].updateTime()
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension BenchMarkViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timers.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Последняя ячейка отличается от всех остальных
        if indexPath.row == timers.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdForStackCell,
                                                          for: indexPath) 
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! CustomCell
        cell.backgroundColor = .blue
        if timers[indexPath.row].timer == nil {
            timers[indexPath.row].timer = (Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.runScheduledTask), userInfo: indexPath.row, repeats: true))
        }
        cell.timerLabel.text = timers[indexPath.row].currentTimeLabel
        return cell
    }
}
