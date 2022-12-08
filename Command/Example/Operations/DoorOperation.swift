//
//  DoorOperation.swift
//  Command
//
//  Created by Shumakov Dmytro on 08.12.2022.
//

import Foundation

class DoorOperation: DelayedOperation {

    override func main() {
        print("\(self): Doors are closed via HomeKit.")
    }

    override var description: String { return "DoorOperation" }
}
