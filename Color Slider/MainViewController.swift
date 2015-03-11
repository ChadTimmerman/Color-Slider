//
//  MainViewController.swift
//  Color Slider
//
//  Created by Chad Timmerman on 3/4/15.
//  Copyright (c) 2015 Chad Timmerman. All rights reserved.
//

import UIKit

let screenSize: CGRect = UIScreen.mainScreen().bounds
let screenHeight = screenSize.height
let screenWidth = screenSize.width

class MainViewController: UIViewController {
    
    var label: UILabel!
    var colorSlider: UISlider!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        self.view.backgroundColor = UIColor(hue:0.36, saturation:0.61, brightness:0.84, alpha:1)

        // Setup the Label
        
        var attrSring:NSAttributedString = NSAttributedString (
            string: "SWIFTY\nSLIDER",
            attributes:[ NSKernAttributeName: 10.0 ]
        )

        label = UILabel()
        label.frame = CGRectMake(0.0, (screenHeight / 2) + 110.0, screenWidth, 60.0)
        label.font = UIFont(name: "AvenirNext-Demibold", size: 15.0)
        label.attributedText = attrSring
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        label.numberOfLines = 2
        self.view.addSubview(label)
    
        // Setup the Color Slider
        
        colorSlider = UISlider()
        colorSlider.frame = CGRectMake(10.0, (screenHeight / 2) - 20.0, screenWidth - 20.0, 40.0)
        colorSlider.minimumValue = 0.0
        colorSlider.maximumValue = 1.0
        colorSlider.value = 0.36
        colorSlider.minimumTrackTintColor = UIColor.whiteColor()
        colorSlider.maximumTrackTintColor = UIColor.whiteColor()
        self.view.addSubview(colorSlider)
        
        self.colorSlider.addTarget(self, action: "getSliderValue:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func getSliderValue(sender: UISlider) {
    
    
        // Returns Float Value
        var sliderValue:Float = self.colorSlider.value;
    
        var colorValue = sliderValue.toCGFloat()
    
        self.view.backgroundColor = UIColor(hue: colorValue, saturation: 0.61, brightness: 0.84, alpha: 1.00)
    
        println(colorValue)

    }

}

extension Float {
    func toCGFloat() -> CGFloat {
        
        // Converts Float to NSString with 2 decimal places
        var stringValue = NSString(format: "%.2f", self)
        
        // Converts NSString to Double
        var color = (stringValue).doubleValue
        
        // Converts Double to CGFloat
        var colorValue = CGFloat(color)
        
        return CGFloat(colorValue)
    }
}
