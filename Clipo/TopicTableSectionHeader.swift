//
//  TopicTableSectionHeader.swift
//  Clipo
//
//  Created by TUNGYING-CHAO on 3/23/16.
//  Copyright © 2016 TUNGYING-CHAO. All rights reserved.
//

import UIKit

protocol SectionHeaderViewDelegate {
    func sectionHeaderView(sectionHeaderView: TopicTableSectionHeader, expandable: Bool)
}

class TopicTableSectionHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sectionButton: UIButton!
    
    @IBAction func expandButton(sender: UIButton) {
        self.selected = !self.selected
        print("No. \(self.sectionNum) is \(self.selected)")
        self.delegate?.sectionHeaderView(self, expandable: self.selected)
        
    }
    var selected = false
    var sectionNum = 0
    var delegate: SectionHeaderViewDelegate?
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        super.drawRect(rect)
    }
    

}
