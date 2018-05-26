//
//  ResultViewController.swift
//  ExpandableTableView
//
//  Created by EthanLin on 2018/5/26.
//  Copyright © 2018 EthanLin. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result:String?
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let result = result else {return}
        resultLabel.text = result
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
