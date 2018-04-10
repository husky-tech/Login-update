//
//  NowSituationViewController.swift
//  TopPage
//
//  Created by 小田光樹 on 2018/04/07.
//  Copyright © 2018年 Koki. All rights reserved.
//

import UIKit
import Firebase

class NowSituationViewController: UIViewController {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    let nowSituation = ["学生","アルバイト","求職者","社員","経営者","自営業","フリーランス","投資家","その他"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.allowsMultipleSelection = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @IBAction func saveAndGoButton(_ sender: Any) {
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func create() {
        
    }
    
    
    
    
}

extension NowSituationViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nowSituation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        viewCell.textLabel?.text = nowSituation[indexPath.row]
        viewCell.selectionStyle = UITableViewCellSelectionStyle.none
        return viewCell
    }
    
}

extension NowSituationViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewCell = tableView.cellForRow(at: indexPath)
        viewCell?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let viewCell = tableView.cellForRow(at: indexPath)
        viewCell?.accessoryType = .none
    }
}














