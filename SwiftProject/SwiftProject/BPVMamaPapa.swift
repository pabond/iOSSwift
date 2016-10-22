//
//  BPVMamaPapa.swift
//  SwiftProject
//
//  Created by Bondar Pavel on 10/19/16.
//  Copyright © 2016 Pavel Bondar. All rights reserved.
//

let kMama = "mama"
let kPapa = "papa"

enum ValueType: Int {
    case valuePapa = 3
    case valueMama = 5
}

import Foundation

func isValid(value1: Int, value2: Int) -> Bool {
    return value1 % value2 == 0 ? false : true
}

func PrintMamaPapa(value: Int) {
    if !isValid(value1: value, value2: ValueType.valuePapa.rawValue) {
        print(kMama, terminator: "")
    }
    
    if !isValid(value1: value, value2: ValueType.valuePapa.rawValue) {
        print(kPapa, terminator: "")
    }
    
    print("")
}
