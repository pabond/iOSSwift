//
//  BPVMamaPapa.swift
//  SwiftProject
//
//  Created by Bondar Pavel on 10/19/16.
//  Copyright © 2016 Pavel Bondar. All rights reserved.
//

let kBPVMama = "mama"
let kBPVPapa = "papa"

enum BPVValueType: Int {
    case BPVValueMama = 5
    case BPVValuePapa = 3
}

import Foundation

func BPVPrintMamaPapa(value: Int) {
    if !Bool(value % BPVValueType.BPVValueMama.rawValue) {
        print(kBPVMama, terminator: "")
    }
    
    if !Bool(value % BPVValueType.BPVValuePapa.rawValue) {
        print(kBPVPapa, terminator: "")
    }
    
    print("")
}