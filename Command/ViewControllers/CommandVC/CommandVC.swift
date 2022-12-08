//
//  CommandVC.swift
//  Command
//
//  Created by Shumakov Dmytro on 08.12.2022.
//

import UIKit
import XCTest

class CommandVC: UIViewController {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testCommandConcept()
    }
    
    // MARK: - Methods
    
    func testCommandConcept() {
        /// The client code can parameterize an invoker with any commands.
        
        let invoker = Invoker()
        invoker.setOnStart(SimpleCommand("Say Hi!"))
        
        let receiver = Receiver()
        invoker.setOnFinish(ComplexCommand(receiver, "Send email", "Save report"))
        invoker.doSomethingImportant()
    }
}

class CommandExample: XCTestCase {

    func testCommandRealWorld() {
        prepareTestEnvironment {

            let siri = SiriShortcuts.shared

            print("User: Hey Siri, I am leaving my home")
            siri.perform(.leaveHome)

            print("User: Hey Siri, I am leaving my work in 3 minutes")
            siri.perform(.leaveWork, delay: 3) /// for simplicity, we use seconds

            print("User: Hey Siri, I am still working")
            siri.cancel(.leaveWork)
        }
    }
}

extension CommandExample {

    struct ExecutionTime {
        static let max: TimeInterval = 5
        static let waiting: TimeInterval = 4
    }

    func prepareTestEnvironment(_ execution: () -> ()) {

        /// This method tells Xcode to wait for async operations. Otherwise the
        /// main test is done immediately.

        let expectation = self.expectation(description: "Expectation for async operations")

        let deadline = DispatchTime.now() + ExecutionTime.waiting
        DispatchQueue.main.asyncAfter(deadline: deadline) { expectation.fulfill() }

        execution()

        wait(for: [expectation], timeout: ExecutionTime.max)
    }
}
