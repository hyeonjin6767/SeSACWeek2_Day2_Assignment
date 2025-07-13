//
//  ShoppingTableViewCell.swift
//  SeSACWeek2_Day2_Assignment
//
//  Created by 박현진 on 7/10/25.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {

    @IBOutlet var checkboxButton: UIButton!
    @IBOutlet var starFillButton: UIButton!
    @IBOutlet var cornerRoundImageView: UIImageView!
    @IBOutlet var shoppinglistShowLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //고정 디자인 모으기
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 2
        cornerRoundImageView.backgroundColor = .systemGray6
        cornerRoundImageView.layer.cornerRadius = 12
        checkboxButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        checkboxButton.tintColor = .black
        starFillButton.tintColor = .black
        starFillButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
    }
}
