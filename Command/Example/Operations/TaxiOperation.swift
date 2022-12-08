//
//  TaxiOperation.swift
//  Command
//
//  Created by Shumakov Dmytro on 08.12.2022.
//

import Foundation

class TaxiOperation: DelayedOperation {

    override func main() {
        print("\(self): Taxi is ordered via Uber")
    }

    override var description: String { return "TaxiOperation" }
}
