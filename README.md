# swift_timer_app

### Timer Setting

    //Declaration & Initialization
    var timer: Timer = Timer()
    var isTimerRunning: Bool = false
    var counter: Double = 0
      
      func someFunction() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
      }

### Run Timer

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
