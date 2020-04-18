//
//  ViewController.swift
//  swift_timer
//
//  Created by shin seunghyun on 2020/04/18.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    //Declaration & Initialization
    var timer: Timer = Timer()
    var isTimerRunning: Bool = false
    var counter: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        
        timerLabel.layer.cornerRadius = 5.0
        timerLabel.layer.masksToBounds = true
        
        resetButton.layer.cornerRadius = 4.0
        resetButton.layer.masksToBounds = true
        resetButton.isEnabled = false
        
        
        startButton.layer.cornerRadius = startButton.bounds.width / 2.0
        startButton.layer.masksToBounds = true
        pauseButton.isEnabled = false
        
    }
    
    

    @IBAction func reset(_ sender: UIButton) {
        timer.invalidate()
        isTimerRunning = false
        counter = 0.0
        timerLabel.text = "00:00:00.0"
        startButton.isEnabled = true
        resetButton.isEnabled = false
    }
    
    
    @IBAction func pause(_ sender: UIButton) {
        resetButton.isEnabled = true
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        isTimerRunning = false
        timer.invalidate() //다시 그려주기
    }
    
    
    @IBAction func start(_ sender: UIButton) {
        //Check if timer is already running
        if !isTimerRunning {
            //Start Timer
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
            resetButton.isEnabled = true
            pauseButton.isEnabled = true
            startButton.isEnabled = false
        }
        
    }
    
    //MARK: - Helper Methods
    @objc func runTimer() {
        counter += 0.1
        timerLabel.text = "\(counter)"
        let flooredCounter: Int = Int(floor(counter)) //소수점 다 날려버림
        let hour: Int = flooredCounter / 3600
        let minute: Int = (flooredCounter % 3600) / 60
        var minuteString: String = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        let second: Int = (flooredCounter % 3600) % 60
        var secondString: String = "\(second)"
        if second < 10 {
            secondString = "0\(second)"
        }
        
        //36.2의 값을 가져옴, %.1f
        //array로 바꿔줌 [36, 2]
        //마지막 숫자를 가져옴
        let decimalSecond: String =
            String(format: "%.1f", counter)
            .components(separatedBy: ".").last!
        
        timerLabel.text = "\(hour):\(minuteString):\(secondString).\(decimalSecond)"
    }
    
}

