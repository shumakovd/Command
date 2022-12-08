//
//  SimpleCommand.swift
//  Command
//
//  Created by Shumakov Dmytro on 08.12.2022.
//

import Foundation

/// Some commands can implement simple operations on their own.
class SimpleCommand: Command {

    private var payload: String

    init(_ payload: String) {
        self.payload = payload
    }

    func execute() {
        print("SimpleCommand: See, I can do simple things like printing (" + payload + ")")
    }
}
