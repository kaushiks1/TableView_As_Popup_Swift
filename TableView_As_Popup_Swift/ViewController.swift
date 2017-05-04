//
//  ViewController.swift
//  TableView_As_Popup_Swift
//
//  Created by Leo on 11/4/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    var arrayTableViewData = [String]()
    var tableViewSortBy: UITableView = UITableView()
    var popover: DXPopover = DXPopover()


    override func viewDidLoad() {
        super.viewDidLoad()


        self.arrayTableViewData.append("USA1")
        self.arrayTableViewData.append("USA2")
        self.arrayTableViewData.append("USA3")
        self.arrayTableViewData.append("USA4")
        self.arrayTableViewData.append("USA5")

        self.tableViewSortBy = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .grouped)
        self.tableViewSortBy.delegate = self
        self.tableViewSortBy.dataSource = self
        //        self.view.addSubview(self.tableViewSortBy)


        self.buttonActionClickToShowPopup(send as AnyObject)


        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonActionClickToShowPopup(_ sender: AnyObject)
    {

        self.tableViewSortBy.frame = CGRect(x: 0, y: 0, width: WD/2, height: CGFloat(HT/12.9) * CGFloat(self.arrayTableViewData.count+1))

        self.popover.contentInset = UIEdgeInsets.zero
        self.popover.backgroundColor = UIColor.white
        self.popover.cornerRadius = 0
        self.popover.arrowSize = CGSize(width: 0,height : 0)


        //(WD - self.tableViewSortBy.frame.size.width)/2
        let startPoint = CGPoint(x: (WD-self.tableViewSortBy.frame.size.width)/2, y: (HT-self.tableViewSortBy.frame.size.height)/2)

        self.popover.show(at: startPoint, popoverPostion: DXPopoverPosition.down, withContentView: self.tableViewSortBy, in: self.view)
    }


    //UITableView Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.arrayTableViewData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")

        cell.textLabel!.text = self.arrayTableViewData[indexPath.row]

        return cell;
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return HT/12.9
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return HT/12.9
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Los Angles"
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print(self.arrayTableViewData[indexPath.row])
        self.popover.dismiss()
    }
    
}

