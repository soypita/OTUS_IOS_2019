//
//  TimerState.swift
//  Homework1
//
//  Created by Дмитрий Сазонов on 13/09/2019.
//  Copyright © 2019 Дмитрий Сазонов. All rights reserved.
//

import Foundation

class TimerState {
    var isRunning = false
    var currentTime = 0
    var currentTimeLabel = "00:00:00"
    var creationDate = Date()
    var timer: Timer?
    lazy var componentsFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        return formatter
    }()
    func updateTime() {
        if (isRunning) {
            self.currentTime += 1
            let hours = currentTime / 3600
            let minutes = currentTime / 60 % 60
            let seconds = currentTime % 60
            self.currentTimeLabel = String(format: "%02i:%02i:%02i", hours, minutes, seconds)
        }
    }
    
    func changeTimerState() {
        isRunning.toggle()
        if (!isRunning) {
            timer?.invalidate()
            timer = nil
        }
    }
    
    func resetTimer() {
        isRunning = false
        currentTime = 0
        currentTimeLabel = "00:00:00"
        timer?.invalidate()
        timer = nil
    }
}
