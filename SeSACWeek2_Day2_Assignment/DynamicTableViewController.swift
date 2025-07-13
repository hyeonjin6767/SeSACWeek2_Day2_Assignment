//
//  DynamicTableViewController.swift
//  SeSACWeek2_Day2_Assignment
//
//  Created by 박현진 on 7/9/25.
//

import UIKit

class DynamicTableViewController: UITableViewController {

    let sections = ["전체 설정", "개인 설정", "기타"]
    let rowsTotalSetting = ["공지사항","실험실","버전정보"]
    let rowsPersonalSetting = ["개인/보안", "알림", "채팅", "멀티프로필"]
    let rowsElse = ["고객센터/도움말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        //print(#function)
        return sections.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(#function)
        if section == 0 {
            return rowsTotalSetting.count
        } else if section == 1 {
            return rowsPersonalSetting.count
        } else if section == 2 {
            return rowsElse.count
        } else {
            return 0
        }
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //print(sections[section])
        return sections[section]
    }
    
    //2차 배열로 바꿔보기
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print(#function, indexPath.section, indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "setting", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = rowsTotalSetting[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = rowsPersonalSetting[indexPath.row]
        } else if indexPath.section == 2 {
            cell.textLabel?.text = rowsElse[indexPath.row]
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //print(#function)
        return 30
   }
}
