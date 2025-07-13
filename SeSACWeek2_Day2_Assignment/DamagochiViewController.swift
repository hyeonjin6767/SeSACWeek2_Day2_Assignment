//
//  DamagochiViewController.swift
//  SeSACWeek2_Day2_Assignment
//
//  Created by 박현진 on 7/8/25.
//

import UIKit

class DamagochiViewController: UIViewController {
    
    //보완1. 오토레이아웃 설정하기
    //보완2. 반복줄이기
    @IBOutlet var damagochiNameNaviItem: UINavigationItem!
    @IBOutlet var storyLabel: UILabel!
    @IBOutlet var storyShowImageView: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var riceCountTextF: UITextField!
    @IBOutlet var waterCountTextF: UITextField!
    @IBOutlet var riceButton: UIButton!
    @IBOutlet var waterButton: UIButton!
    
    var rice = ""
    var water = ""
    var riceCount = 0
    var waterCount = 0
    
    let damagochiImageList = ["물 주세요": UIImage(named: "2-1"),
                              "조금 자랐어요": UIImage(named: "2-2"),
                              "이제 싹이 올라와요": UIImage(named: "2-3"),
                              "노랗게 익었어요": UIImage(named: "2-4"),
                              "이제 올라올 수 있어요": UIImage(named: "2-5"),
                              "구름이 보이네요": UIImage(named: "2-6"),
                              "밝아졌어요": UIImage(named: "2-7"),
                              "올라왔네요": UIImage(named: "2-8"),
                              "환해졌어요!": UIImage(named: "2-9")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeImage()
        riceCountTextF.text = "밥주세용"
        riceButton.setTitle("밥먹기", for: .normal)
        waterCountTextF.text = "물주세용"
        waterButton.setTitle("물먹기", for: .normal)
        
        riceCountTextF.borderStyle = .none
        waterCountTextF.borderStyle = .none
        let borderRice = CALayer()
        borderRice.frame = CGRect(x: 0, y: riceCountTextF.frame.size.height-1, width: riceCountTextF.frame.width, height: 1)
        borderRice.backgroundColor = UIColor.systemGray.cgColor
        borderRice.backgroundColor = UIColor.systemGray.cgColor
        riceCountTextF.layer.addSublayer(borderRice)
        riceCountTextF.textAlignment = .center
        let borderWater = CALayer()
        borderWater.frame = CGRect(x: 0, y: waterCountTextF.frame.size.height-1, width: waterCountTextF.frame.width, height: 1)
        borderWater.backgroundColor = UIColor.systemGray.cgColor
        borderWater.backgroundColor = UIColor.systemGray.cgColor
        waterCountTextF.layer.addSublayer(borderWater)
        waterCountTextF.textAlignment = .center

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let startName = UserDefaults.standard.string(forKey: "대장이름") {
            damagochiNameNaviItem.title = "\(startName)님의 다마고치"
        } else {
            damagochiNameNaviItem.title = "대장님의 다마고치"
        }
    }
    
    @IBAction func keyboardDismiss(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func riceCountTextFClicked(_ sender: UITextField) {
        riceCountTextF.text = nil
    }
    
    @IBAction func waterCountTextFClicked(_ sender: UITextField) {
        waterCountTextF.text = nil
    }
    
    @IBAction func riceButtonClicked(_ sender: UIButton) {
        //옵셔널 바인딩 바꿔보기
        rice = riceCountTextF.text!
        if Int(rice) == nil {
            riceCount += 1
            let levelCheck = levelcheck(riceCheck: Int(exactly: riceCount)!, waterCheck: 0)
            resultLabel.text = "Lv\(levelCheck). 밥알 \(riceCount)개. 물방울 \(waterCount)개"
        } else if Int(rice) != nil && Int(rice)! < 100 {
            riceCount = riceCount + Int(rice)!
            let levelCheck = levelcheck(riceCheck: Int(exactly: riceCount)!, waterCheck: 0)
            resultLabel.text = "Lv\(levelCheck). 밥알 \(riceCount)개. 물방울 \(waterCount)개"
        } else if Int(rice)! >= 100 {
            callAlert(num : 100)
        }
        changeImage()
    }
    
    @IBAction func waterButtonClicked(_ sender: UIButton) {
        //옵셔널 바인딩으로 바꿔보기
        water = waterCountTextF.text!
        if let test = Int(water) {
            if test < 50 {
                waterCount = waterCount + test
                let levelCheck = levelcheck(riceCheck: 0, waterCheck: Int(exactly: waterCount)!)
                resultLabel.text = "Lv\(levelCheck). 밥알 \(riceCount)개. 물방울 \(waterCount)개"
            } else if test >= 50 {
                callAlert(num: 50)
            }
        } else {
            waterCount += 1
            let levelCheck = levelcheck(riceCheck: Int(exactly: riceCount)!, waterCheck: 0)
            resultLabel.text = "Lv\(levelCheck). 밥알 \(riceCount)개. 물방울 \(waterCount)개"
        }
        /*
        if Int(water) == nil {
            waterCount += 1
            let levelCheck = levelcheck(riceCheck: Int(exactly: riceCount)!, waterCheck: 0)
            resultLabel.text = "Lv\(levelCheck). 밥알 \(riceCount)개. 물방울 \(waterCount)개"
        } else if Int(water) != nil && Int(water)! < 50 {
            waterCount = waterCount + Int(water)!
            let levelCheck = levelcheck(riceCheck: 0, waterCheck: Int(exactly: waterCount)!)
            resultLabel.text = "Lv\(levelCheck). 밥알 \(riceCount)개. 물방울 \(waterCount)개"
        } else if (Int(water)! >= 50) {
            callAlert(num: 50)
        }
         */
        changeImage()
    }
    
    func callAlert (num: Int) {
        let wrong = UIAlertController(title: "\(num)개 이상은 먹을 수 없습니다", message: nil, preferredStyle: .alert)
        let check = UIAlertAction(title: "확인", style: .default)
        wrong.addAction(check)
        present(wrong, animated: true)
    }
    
    func changeImage() {
        // if let, guard let // 타입 캐이스팅(as)
        storyLabel.text = damagochiImageList.keys.randomElement()
        if let image = damagochiImageList[storyLabel.text!] as? UIImage {
            storyShowImageView.image = image
        }
        //storyLabel.text?.appending("\(UserDefaults.standard.string(forKey: "대장이름")!)님")
    }
    
    func levelcheck(riceCheck: Int, waterCheck: Int) -> Int {
        let level = (riceCheck / 5) + (waterCheck / 2)
        let levelChange = level/10
        if levelChange <= 10 {
            return levelChange
        } else {
            return 10
        }
    }
}
