//
//  ViewController.swift
//  UpDownGame
//
//  Created by 484 on 01/10/2020.
//  Copyright © 2020 484geeyong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomValue: Int = 0
    var tryCount: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal) //이미지를 직접 추가해주기..
        reset()
    }
    @IBAction func sliderValueChanged(_ sender: UISlider){
        //print(sender.value)
        sliderValueLabel.text = String(Int(sender.value))
    }
    
    func showAlert(message: String){
        
        let alert = UIAlertController(title:nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in self.reset()
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton){
         print(slider.value)
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount = tryCount + 1
        tryCountLabel.text = " \(tryCount)/ 5"
        
        if randomValue == hitValue {
            showAlert(message: "YOU HIT")
            return  //종료
        }
        if tryCount >= 5 {
            
            showAlert(message: "You lose")
            return
        }
        if randomValue > hitValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
            
        }
        else{
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
    }
    @IBAction func touchUPResetButton(_ sender: UIButton){
        print("touch up reset button")
        reset()
    }
    func reset(){
        randomValue = Int.random(in: 0...30) //0~30
        print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
        
    }


}

