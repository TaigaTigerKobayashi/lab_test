//
//  UIViewController2.swift
//  stopwatch final
//
//  Created by 小林大河 on 2020/04/27.
//  Copyright © 2020 小林大河. All rights reserved.
//

import UIKit

class UIViewController2: UIViewController {

var timer = Timer()
let calendar = Calendar(identifier: .gregorian)
var toDate = Calendar.current.date (byAdding: .minute, value:1 ,to: Date())!
    

    @IBOutlet weak var startButton2: UIButton!
    @IBOutlet weak var stopButton2: UIButton!
    

        @IBAction func startButton2(_ sender: UIButton) {
        remainTimer.text = ""

        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UIViewController2.timeCounter), userInfo: nil, repeats: true)
    }
    

    
    

    @IBOutlet weak var remainTimer: UILabel!

  @IBAction func stopButton2(_ sender: UIButton) {
      timer.invalidate()
    }

    
override func viewDidAppear(_ animated: Bool){
    toDate = Calendar.current.date(byAdding: .hour, value:2000, to:Date())!
}

    @objc func timeCounter(){
    remainTimer.text = TimeFunction(setDate: toDate)
}

func TimeFunction(setDate: Date) -> String{
    var nowDate: Date = Date()
    

    let timeValue = calendar.dateComponents([
        .hour, .minute, .second], from: nowDate, to: setDate)
    
    return String(format: "残り"+"%02d時間:%02d分:%02d秒",

                  timeValue.hour!,
                  timeValue.minute!,
                  timeValue.second!)
}
    

}
