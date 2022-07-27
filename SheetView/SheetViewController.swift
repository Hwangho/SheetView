//
//  SheetViewController.swift
//  SheetView
//
//  Created by 송황호 on 2022/07/27.
//

import UIKit

class SheetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    static let identifier = "SheetViewController"
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var delegate: SendDataDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.navigationBar.tintColor = .black
        
        navigationItem.title = "Navigation Bar"
        
        let leftButton = UIImage(systemName: "person.circle")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftButton, style: .plain, target: self, action: nil)
        
        let rightButton = UIImage(systemName: "person.circle")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightButton, style: .plain, target: self, action: nil)

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SheetTableViewCell.identifier, for: indexPath) as? SheetTableViewCell else {return UITableViewCell() }
        
        cell.textLabel?.text = "tableView Cell"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.reciveData(response: indexPath.row)
    }

}
