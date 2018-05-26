//
//  ViewController.swift
//  ExpandableTableView
//
//  Created by EthanLin on 2018/5/26.
//  Copyright © 2018 EthanLin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var sections = [Section(genre: "普通的Cell", movies: ["1","2","3","4","5","6"], expanded: false),Section(genre: "PickerViewCell", movies: [], expanded: false)]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource, ExpandableHeaderViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return sections[section].movies.count
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let numberCell = tableView.dequeueReusableCell(withIdentifier: CellIDManager.numberCell, for: indexPath)
            numberCell.textLabel?.text = sections[indexPath.section].movies[indexPath.row]
            return numberCell
        case 1:
            let pickerCell = tableView.dequeueReusableCell(withIdentifier: CellIDManager.pickerCell, for: indexPath) as! PickerTableViewCell
            pickerCell.delegate = self
            pickerCell.index = indexPath
            return pickerCell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            if sections[indexPath.section].expanded{
                return 44
            }else{
                return 0
            }
        case 1:
            if sections[indexPath.section].expanded{
                return 200
            }else{
                return 0
            }
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            performSegue(withIdentifier: SegueIDmanager.showResult, sender:"\( sections[indexPath.section].movies[indexPath.row]) in \(indexPath.section)")
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.delegate = self
        header.section = section
        header.updateUI(topic: sections[section].genre)
        //上面三行可以簡化成，custominit是在裡面定義的方法
//        header.customInit(title: sections[section].genre, section: section, delegate: self)
        return header
    }
    
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
}
extension ViewController: PickerCellTappedButtonDelegate{
    func pickerDidSelected(title: String, index: IndexPath) {
        performSegue(withIdentifier: SegueIDmanager.showResult, sender: "\(title) in \(index.section)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIDmanager.showResult{
            guard let resultVC = segue.destination as? ResultViewController else {return}
            guard let result = sender as? String else {return}
            resultVC.result = result
        }
    }
    
}
