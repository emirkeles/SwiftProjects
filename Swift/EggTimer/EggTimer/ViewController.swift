import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var player: AVAudioPlayer!
    
    
    
    let eggTimes = ["Soft":300, "Medium":450, "Hard":720]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        switch hardness {
        case "Soft":
            titleLabel.text = "Kayısı"
        case "Medium":
            titleLabel.text = "Orta"
        
        default:
            titleLabel.text = "Çok pişmiş"
        }
        progressBar.progress = 0.0
        secondsPassed = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    
    @objc func update() {
        if secondsPassed < totalTime {
            secondsPassed+=1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
        }
        else {
            timer.invalidate()
            titleLabel.text = "Bitti!"
            playSound()
        }
    }
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

