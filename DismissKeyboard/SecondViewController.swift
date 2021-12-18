//
//  SecondViewController.swift
//  DismissKeyboard
//
//  Created by 山本響 on 2021/12/13.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //tableView.keyboardDismissMode = .onDrag // or .interactive
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(TextTableViewCell.self)", for: indexPath) as! TextTableViewCell
        cell.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 10000)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}

extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
}
