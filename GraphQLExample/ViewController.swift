//
//  ViewController.swift
//  GraphQLExample
//
//  Created by Thanh-Dung Nguyen on 8/20/17.
//  Copyright © 2017 Thanh-Dung Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AddGirlDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var girls: [GirlFullDetails] = [GirlFullDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "GirlCell", bundle: nil), forCellReuseIdentifier: "GirlCell")
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        self.queryAllGirls()
    }

    // MARK: Query
    func queryAllGirls() {
        let girlDetailsQuery = GirlsDetailsQuery()
        
        apollo.fetch(query: girlDetailsQuery, cachePolicy: .fetchIgnoringCacheData) { [weak self] result, error in
            guard let girls = result?.data?.allGirls else { return }
            self?.girls = girls.map { $0.fragments.girlFullDetails }
            
            self?.tableView.reloadData()
        }
    }
    
    func addGirl(name: String, age: Int, height: Double) {
        // create new girl
        indicator.startAnimating()
        
        let createGirlMutation = CreateGirlMutation(name: name, age: 20, height: 165)
        
        apollo.perform(mutation: createGirlMutation) { [weak self] result, error in
            self?.indicator.stopAnimating()
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            // reload data
            self?.queryAllGirls()
        }
    }
    
    func update(girl: GirlFullDetails) {
        indicator.startAnimating()
        
        let updateGirlMutation = UpdateGirlMutation(id: girl.id, newName: girl.name, newAge: girl.age, newHeight: girl.height)
        
        apollo.perform(mutation: updateGirlMutation) { [weak self] result, error in
            self?.indicator.stopAnimating()
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            // reload data
            self?.queryAllGirls()
        }
    }
    
    // MARK: IBAction
    @IBAction func addNew(_ sender: UIButton) {
        let addVC = AddGirlVC(nibName: "AddGirlVC", bundle: nil)
        
        addVC.mode = .add
        // set the presentation style
        addVC.modalPresentationStyle = UIModalPresentationStyle.popover
        
        // set up the popover presentation controller
        addVC.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        addVC.popoverPresentationController?.delegate = self
        addVC.popoverPresentationController?.sourceView = sender
        addVC.popoverPresentationController?.sourceRect = sender.bounds
        addVC.delegate = self
        
        // present the popover
        self.present(addVC, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return girls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GirlCell") as? GirlCell {
            let girlDetails = self.girls[indexPath.row]
            
            cell.bind(girl: girlDetails)
            cell.selectionStyle = .none

            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let girl = self.girls[indexPath.row]
        
        let addVC = AddGirlVC(nibName: "AddGirlVC", bundle: nil)
        addVC.mode = .edit
        addVC.girl = girl
        addVC.delegate = self
        
        self.navigationController?.pushViewController(addVC, animated: true)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        // return UIModalPresentationStyle.FullScreen
        return UIModalPresentationStyle.none
    }
}
