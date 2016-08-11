//
//  InputView.swift
//  LoginViewDemo
//
//  Created by Thái Bô Lão on 8/11/16.
//  Copyright © 2016 TBLStudio. All rights reserved.
//

import UIKit

@IBDesignable
class InputView: UIView {

    // MARK: - CONSTANTS
    let nibName = "InputView"
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var containerView: UIView!
    
    //MARK: - @IBInspectable
    @IBInspectable var placeHolderString: String = " "{
        didSet {
            self.textField.placeholder = placeHolderString
        }
    }
    
    @IBInspectable var iconImg:UIImage = UIImage() {
        didSet {
            self.iconImage.image = iconImg
        }
    }
    
    // MARK: - VARIABLES
    var view: UIView!
    
    // MARK: - INITIALIZATION
    override init(frame: CGRect) {
        // 1. setup any properties here
        // 2. call super.init(frame:)
        super.init(frame: frame)
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        xibSetup()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        // use bounds not frame or it'll be offset
        view.frame = bounds
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let view: UIView = bundle.loadNibNamed(nibName, owner: self, options: nil)[0] as! UIView
        view.frame = self.bounds
        return view
    }


}

extension InputView: UITextFieldDelegate {
    func textFieldDidBeginEditing(textField: UITextField) {
        self.containerView.backgroundColor = UIColor(red: 0, green: 188/255, blue: 212/255, alpha: 1)
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        self.containerView.backgroundColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1)
        return true
    }

}
