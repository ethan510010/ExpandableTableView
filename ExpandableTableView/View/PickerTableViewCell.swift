//
//  PickerTableViewCell.swift
//  ExpandableTableView
//
//  Created by EthanLin on 2018/5/26.
//  Copyright © 2018 EthanLin. All rights reserved.
//

import UIKit

protocol PickerCellTappedButtonDelegate {
    func pickerDidSelected(title:String,index:IndexPath)
}

class PickerTableViewCell: UITableViewCell {
    
    var delegate:PickerCellTappedButtonDelegate?
    var index:IndexPath?
    
    var pickerViewArray = ["選項1","選項2"]
    
    var pickerSelectedTitle:String = "選項1"
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBAction func ensureAction(_ sender: UIButton) {
        delegate?.pickerDidSelected(title: pickerSelectedTitle, index: index!)
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pickerView.delegate = self
        pickerView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension PickerTableViewCell: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pickerSelectedTitle = pickerViewArray[row]
    }
    
}
