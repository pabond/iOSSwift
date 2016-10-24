//
//  RoundView.swift
//  SwiftTasks
//
//  Created by Bondar Pavel on 10/23/16.
//  Copyright © 2016 Pavel Bondar. All rights reserved.
//

import UIKit

let defaultShadowWidth = 10.0
let defaultShadowHeigth = 10.0
let defaultCornerRadius = 5.0
let defaultShadowOpacity = 0.5

extension RoundView {
    func roundedViewWithShadowing() -> Void {
        self.roundedViewWithShadowing(shadowColor: UIColor.black)
    }
    
    func roundedViewWithShadowing(shadowColor: UIColor) -> Void {
        self.roundedViewWithShadowing(shadowColor: shadowColor, shadowOpacity: CGFloat(defaultShadowOpacity))
    }
    
    func roundedViewWithShadowing(shadowColor: UIColor, shadowOpacity: CGFloat) -> Void {
        self.roundedViewWithShadowing(shadowColor: shadowColor,
                                      shadowOpacity: shadowOpacity,
                                      shadowSize: CGSize(width: defaultShadowWidth, height: defaultShadowHeigth))
    }
    
    func roundedViewWithShadowing(shadowColor: UIColor, shadowOpacity: CGFloat, shadowSize: CGSize) -> Void {
        self.roundedViewWithShadowing(shadowColor: shadowColor,
                                      shadowOpacity: shadowOpacity,
                                      shadowSize: shadowSize,
                                      cornerRadius: CGFloat(defaultCornerRadius))
    }
    
    func roundedViewWithShadowing(shadowColor: UIColor,
                                  shadowOpacity: CGFloat,
                                  shadowSize: CGSize,
                                  cornerRadius: CGFloat) -> Void
    {
        let layer = self.layer;
        self.roundedView(cornerRadius: self.frame.width / 2)
        layer.masksToBounds = false
        
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowSize
        
        layer.shadowRadius = CGFloat(cornerRadius)
        layer.shadowOpacity = Float(shadowOpacity)
    }
}


class RoundView: RoundedView {

}
