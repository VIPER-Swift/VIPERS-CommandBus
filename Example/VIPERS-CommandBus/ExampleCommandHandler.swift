//
//  ExampleCommandHandler.swift
//  VIPERS-CommandBus
//
//  Created by Jan Bartel on 11.04.16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import VIPERS_CommandBus_Protocol

class ExampleCommandHandler : CommandHandlerProtocol{
    
    // check if this handler is responsible for a given command
    func isResponsible(command: Any!) -> Bool{
        return command is ICommandYouToSaySomething
    }
    
    
    //return your result in completion
    func process<T>(command: Any!, completion: ((result: T?, error: ErrorType?) -> Void)?)  throws{
        
        let messageIWouldLikeToSay = "Hello World"
        
        completion?(result: (messageIWouldLikeToSay as! T),error:nil)
    }
 
    /*
    //
    // without generics:
    //
    func process(command: Any!, completion: ((result: Any?, error: ErrorType?) -> Void)?) throws{
        
        let messageIWouldLikeToSay = "Hello World"
        
        completion?(result: messageIWouldLikeToSay,error:nil)
    
    }
    */

}