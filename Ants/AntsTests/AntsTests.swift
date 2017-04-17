//
//  AntsTests.swift
//  AntsTests
//
//  Created by Johannes Starke on 21.01.17.
//  Copyright (c) 2017 Johannes Starke. All rights reserved.
//

import XCTest
import Ants

struct TestAntTasks {
    static func count(from: Int, to: Int, inBackground background: Bool) -> AntTask<Int> {
        return AntTask<Int>(name: "count", config: background ? .background : .ui, work: {
            
            var result = from
            
            for index in from ..< to {
                print(index)
                
                result = index
            }
            
            return result
            
        })
    }
}

class AntsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAnt() {
        let testExpectation = expectation(description: "test")
        
        let _ = Ants.async { ant in
            var current = 0
            
            do {
                current = try ant.await(result: TestAntTasks.count(from: current, to: 1000, inBackground: true))
                current = try ant.await(result: TestAntTasks.count(from: current, to: 2000, inBackground: false))
                current = try ant.await(result: TestAntTasks.count(from: current, to: 3000, inBackground: true))
            } catch {
                
            }
            
            print(current)
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10.0) { error in
            XCTAssertNil(error)
        }
    }
    
    func testCancelling() {
        let testExpectation = expectation(description: "test")
        
        let queen = Ants.async { ant in
            var current = 0
            
            do {
                current = try ant.await(result: TestAntTasks.count(from: current, to: 1000, inBackground: true))
                current = try ant.await(result: TestAntTasks.count(from: current, to: 2000, inBackground: false))
                current = try ant.await(result: TestAntTasks.count(from: current, to: 3000, inBackground: true))
            } catch let error as AntError {
                switch error {
                case .emptyResult:
                    break
                case .cancelled:
                    testExpectation.fulfill()
                }
            } catch {
                
            }
            
            print(current)
        }
        
        DispatchQueue(label: "test1").async {
                                         queen.cancel()
                                     }
        
        waitForExpectations(timeout: 10.0) { error in
            XCTAssertNil(error)
        }
    }
}
