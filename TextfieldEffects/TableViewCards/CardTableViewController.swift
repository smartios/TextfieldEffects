//
//  CardTableViewController.swift
//  TextfieldEffects
//
//  Created by Vaibhav Agarwal on 3/29/18.
//  Copyright © 2018 Vaibhav Agarwal. All rights reserved.
//

import UIKit

class CardTableViewController: UITableViewController {

    var array = ["1", "2", "3","4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setdefault()
    }
    
    func setdefault()
    {
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "CardTableViewCell", bundle: nil), forCellReuseIdentifier: "cardCell")
        
        tableView.canCancelContentTouches = false
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = 150
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardTableViewCell
        let view = cell.viewWithTag(1)!
        
        setupPan(view: view)
        
        cell.headingLabel.text = "Header"
        cell.subHeadingLabel.text = "SubHeading"
        cell.MessageLabel.text = "bwfboiwefbowfbjierwbfliuerbfierbfqhe;qkeh;kqwe;kqwej;qwjeq;wje;lqwej;qlwje;qwje;qje;kqwj;kqwje;kwje;kqje;kjierbgirebgihqrwbfkhqwrbfkhqwrbfkjhwrbfkhwbfkjwbfkwbfkjwbfkwbfkwbfkwebfkwbfkjwebfkjwebfkjwebfjwebfjkewfb"
        cell.date_time_Label.text = "12 Dec 2018"
        cell.backgroundColor = hexStringToUIColor(hex: "dedede")
        return cell
    }

    func setupPan(view: UIView)
    {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panHandle(gesture:)))
        view.addGestureRecognizer(pan)
    }
    
    
    @objc func panHandle(gesture: UIPanGestureRecognizer)
    {
        var translation = gesture.translation(in: self.view)
        
        if gesture.state == .began || gesture.state == .changed
        {
            if((gesture.view?.frame.origin.x)! + (gesture.view?.frame.size.width)! + translation.x) > self.view.frame.width - 10
            {
                let width = ((gesture.view?.frame.origin.x)! + (gesture.view?.frame.size.width)! + translation.x)
                let trans = width - (self.view.frame.width - 10)
                translation = CGPoint(x: translation.x - trans, y: translation.y)
                //return
            }
            
             gesture.view?.center = CGPoint(x: (gesture.view?.center.x)! + translation.x, y: (gesture.view?.center.y)!)
             gesture.setTranslation(CGPoint.zero, in: self.view)
        }
        else if gesture.state == .ended
        {
            if ((gesture.view?.frame.origin.x)! + translation.x) <= -(self.view.frame.size.width/2)
            {
                UIView.animate(withDuration: 0.3, animations: {
                    gesture.view?.center = CGPoint(x: -(self.view.frame.size.width), y: (gesture.view?.center.y)!)
                })
                
                let pointInTable: CGPoint = (gesture.view?.superview!.convert((gesture.view?.superview!.frame.origin)!, to: self.tableView))!
                let cellIndexPath = self.tableView?.indexPathForRow(at: pointInTable)
                array.remove(at: (cellIndexPath?.row)!)
                self.tableView.reloadData()
            }
            else
            {
                UIView.animate(withDuration: 0.3, animations: {
                    gesture.view?.center = CGPoint(x: self.view.center.x, y: (gesture.view?.center.y)!)
                })
            }
            
            gesture.setTranslation(CGPoint.zero, in: self.view)
        }
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
