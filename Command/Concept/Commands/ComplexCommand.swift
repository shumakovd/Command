//
//  ComplexCommand.swift
//  Command
//
//  Created by Shumakov Dmytro on 08.12.2022.
//

import Foundation

/// However, some commands can delegate more complex operations to other
/// objects, called "receivers."
class ComplexCommand: Command {

    private var receiver: Receiver

    /// Context data, required for launching the receiver's methods.
    private var a: String
    private var b: String

    /// Complex commands can accept one or several receiver objects along with
    /// any context data via the constructor.
    init(_ receiver: Receiver, _ a: String, _ b: String) {
        self.receiver = receiver
        self.a = a
        self.b = b
    }

    /// Commands can delegate to any methods of a receiver.
    func execute() {
        print("ComplexCommand: Complex stuff should be done by a receiver object.\n")
        receiver.doSomething(a)
        receiver.doSomethingElse(b)
    }
}
