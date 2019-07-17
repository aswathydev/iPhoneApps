//
//  FSCaleViewController.swift
//  FSCaldrDemo
//
//  Created by reubro on 27/05/19.
//  Copyright © 2019 Reubro. All rights reserved.
//

import UIKit
import FSCalendar


class FSCaleViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, FSCalendarDelegate{
    
    var flag: Int?
    @IBOutlet var fscalendar: FSCalendar!
    @IBOutlet var collview: UICollectionView!
    @IBOutlet var dressimg: UIImageView!
    @IBOutlet var dressname: UILabel!
    
    var arrColor = [UIColor.red, UIColor.black, UIColor.yellow, UIColor.blue, UIColor.orange, UIColor.magenta, UIColor.red, UIColor.black, UIColor.yellow, UIColor.blue, UIColor.orange, UIColor.magenta]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collview.delegate   = self
        self.collview.dataSource = self
        
        
    }
    //MARK:- Button Action
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        calendar.allowsMultipleSelection = true
        //if date == NSDate{
        // if flag == 0 {
        self.dressimg.image = UIImage(named: "sample2")
        self.dressname.text = "Dress Name"
        //  }
        // flag = 1
    }
    func calendar(_ calendar: FSCalendar, shouldDeselect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        //    if flag == 1{
        self.dressname.isHidden = true
        self.dressimg.isHidden  = true
        //  }
        //  flag = 0
        return true
    }
    
    //MARK:- Collectionview delegate and datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrColor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! colordemocolnVwCell
        cell.colrLabel.backgroundColor = arrColor[indexPath.row]
        cell.colrLabel.layer.masksToBounds = true
        return cell
    }
}
extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}


