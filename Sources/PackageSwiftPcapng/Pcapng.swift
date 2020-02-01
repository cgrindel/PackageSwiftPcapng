//
//  File.swift
//  
//
//  Created by Darrell Root on 2/1/20.
//

import Foundation

public struct Pcapng {
    let originalData: Data
    var done = false     // set to true at end of data or when block size exceeds remaining data size
    public init?(data inputData: Data) {
        self.originalData = inputData
        var data = inputData
        
        while !done {
            guard data.count >= 8 else {
                done = true
                break
            }
            let blockType = getUInt32(data: data)
            print("block type 0x%x",blockType)
            let blockLength = getUInt32(data: data.advanced(by: 4))
            print("blockLength \(blockLength)")
            done = true
        }
        func getSectionHeader() {
            
        }
    }

    /**
     getUInt32 assumes 4 bytes exist in data or it will crash
     */
    func getUInt32(data: Data)-> UInt32 {
        let octet1: UInt32 = UInt32(data[data.startIndex]) << 24
        let octet2: UInt32 = UInt32(data[data.startIndex + 1]) << 16
        let octet3: UInt32 = UInt32(data[data.startIndex + 2]) << 8
        let octet4: UInt32 = UInt32(data[data.startIndex + 3])
        debugPrint(" octet1 \(octet1) octet2 \(octet2) octet3 \(octet3) octet4 \(octet4)")
        return octet1 + octet2 + octet3 + octet4
    }
}
