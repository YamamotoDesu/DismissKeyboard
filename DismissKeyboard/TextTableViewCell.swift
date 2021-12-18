//
//  TextTableViewCell.swift
//  DismissKeyboard
//
//  Created by 山本響 on 2021/12/18.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var samleText: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }

}
