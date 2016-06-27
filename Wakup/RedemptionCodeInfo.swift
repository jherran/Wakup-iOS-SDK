//
//  RedemptionCodeInfo.swift
//  Wakup
//
//  Created by Guillermo Gutiérrez on 22/6/16.
//  Copyright © 2016 Yellow Pineapple. All rights reserved.
//

import Foundation

public class RedemptionCodeInfo {
    public let limited: Bool
    public let totalCodes: Int?
    public let availableCodes: Int?
    
    public init(limited: Bool, totalCodes: Int?, availableCodes: Int?) {
        self.limited = limited
        self.totalCodes = totalCodes
        self.availableCodes = availableCodes
    }
}