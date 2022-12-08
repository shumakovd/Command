//
//  WindowOperation.swift
//  Command
//
//  Created by Shumakov Dmytro on 08.12.2022.
//

import Foundation

class WindowOperation: DelayedOperation {

    override func main() {
        print("\(self): Windows are closed via HomeKit.")
    }

    override var description: String { return "WindowOperation" }
}
