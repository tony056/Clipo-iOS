//
//  ProjectExpandTableViewCell.swift
//  Clipo
//
//  Created by TUNGYING-CHAO on 3/21/16.
//  Copyright © 2016 TUNGYING-CHAO. All rights reserved.
//

import UIKit
import Material

class ProjectExpandTableViewCell: UITableViewCell {
    var crewMember: CrewMember? { didSet { if let cm = crewMember { configureForCrewMember(cm) } } }
    
    @IBOutlet weak var projectImageView: UIImageView!
    
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var toolbarStackView: UIStackView!
    
    
    @IBOutlet weak var toolbarStackViewHeightConstraint: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        toolbarStackViewHeightConstraint.constant = 0.0
        toolbarStackView.hidden = true
        roundImageView(self.projectImageView)
    }
    
    func configureForCrewMember(member: CrewMember) {
        projectImageView.image = UIImage(named: member.imageName)
        projectNameLabel.text = member.name
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let constant: CGFloat = selected ? 30.0 : 0.0
        
        print("Setting constant to \(constant) - Animated: \(animated)")
        
        if !animated {
            toolbarStackViewHeightConstraint.constant = constant
            toolbarStackView.hidden = !selected
            
            return
        }
        
        UIView.animateWithDuration(0.3, delay: 0.0, options: [.AllowUserInteraction, .BeginFromCurrentState], animations: {
            self.toolbarStackViewHeightConstraint.constant = constant
            self.layoutIfNeeded()
            }, completion: { completed in
                self.toolbarStackView.hidden = !selected
        })
    }
    
    func roundImageView(target: UIImageView){
        target.layer.cornerRadius = 10.0
        target.clipsToBounds = true
        
        target.layer.borderWidth = 3.0
        target.layer.borderColor = MaterialColor.grey.darken3.CGColor
    }

}
