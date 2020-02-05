//
//  File.swift
//  
//
//  Created by Darrell Root on 2/4/20.
//

import Foundation

public protocol PcapngPacket: CustomStringConvertible {
    var blockType: UInt32 { get }
    var blockLength: Int { get }
    var originalLength: Int { get }
    var packetData: Data { get }
    var finalBlockLength: Int { get }
    var description: String { get }
}
