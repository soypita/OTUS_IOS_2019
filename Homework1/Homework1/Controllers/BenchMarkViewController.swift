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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        for timerItem in timers {
            timerItem.resetTimer()
        }
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

// MARK: - UICollectionViewDelegate
extension BenchMarkViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Все ячейки кроме последней работают как таймеры
        if indexPath.row != timers.count {
           timers[indexPath.row].changeTimerState()
        }
    }
}
