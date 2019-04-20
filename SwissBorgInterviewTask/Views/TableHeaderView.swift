//
//  TableHeaderView.swift
//  SwissBorgInterviewTask
//
//  Created by Istvan Balogh on 2019. 04. 20..
//  Copyright © 2019. Balogh István. All rights reserved.
//

import UIKit

class TableHeaderView: UIView {

  
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var dailyLowLabel: UILabel!
    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var dailyHighLabel: UILabel!
    
    func update(with model: TableHeaderViewModel) {
        self.volumeLabel.text = model.volumeText
        self.dailyLowLabel.text = model.dailyLowText
        self.lastLabel.text = model.lastText
        self.percentageLabel.text = model.percentageText
        self.dailyHighLabel.text = model.dailyHighText
    }
}
