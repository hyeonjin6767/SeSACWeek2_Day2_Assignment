//
//  ShoppingTableViewController.swift
//  SeSACWeek2_Day2_Assignment
//
//  Created by 박현진 on 7/10/25.
//

import UIKit

struct Shopping {
    var shoppingList: String
    let favoriteList: Bool
    let shoppingDone: Bool
}

class ShoppingTableViewController: UITableViewController {

    @IBOutlet var shoppinglistTextF: UITextField!
    @IBOutlet var shoppinglistAddButton: UIButton!
    @IBOutlet var cornerRoundUIView: UIView!
    
    //구조체 배열로 개선
    var shopping: [Shopping] = [
        Shopping(shoppingList: "그립톡 구매하기", favoriteList: true, shoppingDone: false),
        Shopping(shoppingList: "사이다 구매", favoriteList: false, shoppingDone: true),
        Shopping(shoppingList: "아이패드 케이스 최저가 알아보기", favoriteList: false, shoppingDone: true),
        Shopping(shoppingList: "양말", favoriteList: true, shoppingDone: true)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cornerRoundUIView.layer.cornerRadius = 15
        cornerRoundUIView.backgroundColor = .systemGray6
        shoppinglistTextF.backgroundColor = .systemGray6
        shoppinglistTextF.textColor = .black
        shoppinglistTextF.borderStyle = .none
        shoppinglistTextF.textColor = .systemGray
        shoppinglistAddButton.backgroundColor = .systemGray5
        shoppinglistAddButton.layer.cornerRadius = 15
        shoppinglistTextF.placeholder = "무엇을 구매하실 건가요?"
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 3
        } else {
            return 0
        }
    }

    @IBAction func shoppinglistAddButtonClicked(_ sender: UIButton) {
        shopping.append(Shopping(shoppingList: shoppinglistTextF.text!, favoriteList: (Bool().description.randomElement() != nil), shoppingDone: (Bool().description.randomElement() != nil)))
        tableView.reloadData()
        print(shopping)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        shopping.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopping.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingMemo", for: indexPath) as! ShoppingTableViewCell
        cell.shoppinglistShowLabel.text = shopping[indexPath.row].shoppingList
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
