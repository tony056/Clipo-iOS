//
//  MemberTableViewCell.swift
//  Clipo
//
//  Created by TUNGYING-CHAO on 3/25/16.
//  Copyright © 2016 TUNGYING-CHAO. All rights reserved.
//

import UIKit
//import MaterialKit
import Material

protocol MemberSelectDelegate {
    func showPopoverController(type: String, sender: RaisedButton)
}


class MemberTableViewCell: UITableViewCell {

    @IBOutlet weak var deleteBtn: FlatButton!
    @IBOutlet weak var selectBtn: RaisedButton!
    
    @IBAction func deleteMember(sender: FlatButton) {
    }
    @IBAction func selectMemberType(sender: UITableViewCell) {
        self.delegate?.showPopoverController(self.selectBtn.currentTitle!, sender: self.selectBtn)
    }
    var delegate : MemberSelectDelegate?
    var row : Int?
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.deleteBtn = MKButton(type:)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
