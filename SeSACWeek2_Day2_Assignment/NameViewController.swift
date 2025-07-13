//
//  NameViewController.swift
//  SeSACWeek2_Day2_Assignment
//
//  Created by 박현진 on 7/8/25.
//

import UIKit

class NameViewController: UIViewController {

    @IBOutlet var nameTextF: UITextField!
    @IBOutlet var nameNaviItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextF.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: nameTextF.frame.size.height-1, width: nameTextF.frame.width, height: 1)
        border.backgroundColor = UIColor.systemGray.cgColor
        border.backgroundColor = UIColor.systemGray.cgColor
        nameTextF.layer.addSublayer(border)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameNaviItem.title = "\(UserDefaults.standard.string(forKey: "대장이름")!)님의 다마고치"
    }
    
    @IBAction func nameTextFClicked(_ sender: UITextField) {
        nameTextF.text = nil
    }
    
    @IBAction func nameStoreBarButtonItem(_ sender: UIBarButtonItem) {
        //print(Int(nameTextF.text!.count))
        switch Int(nameTextF.text!.count) {
        case ...1 : nameTextF.text = "다시 입력해주세요"
        case 1...6 : UserDefaults.standard.set(nameTextF.text, forKey: "대장이름")
        case 6... : nameTextF.text = "다시 입력해주세요"
        default : print("오류 발생")
        }
    }
}
