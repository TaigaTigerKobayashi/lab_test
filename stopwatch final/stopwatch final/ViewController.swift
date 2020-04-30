
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var labelOutlets: UILabel!
    
    var myTimer = Timer()
    var myTime: Int = 0

    func codeToBeRun(){
        myTime += 1
        let h = myTime / 3600
        let m = (myTime % 3600) / 60
        let s = (myTime % 60)
        labelOutlets.text = String(String(format: "%02d:%02d:%02d", h, m, s))
       
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
        myTimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block:{_ in self.codeToBeRun()})
        startButton.isEnabled = false
    }
    
    
    @IBAction func stopPressed(_ sender: UIButton) {myTimer.invalidate()
        startButton.isEnabled = true
    }
    
    
    @IBAction func resetPresseed(_ sender: UIButton) {
        myTimer.invalidate()
        
        myTime = 0
        labelOutlets.text = String(String(format: "%02d:%02d:%02d", 00, 00, 00))
        startButton.isEnabled = true
    }
    
}
