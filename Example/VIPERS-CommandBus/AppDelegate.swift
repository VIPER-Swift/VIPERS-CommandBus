//
//  AppDelegate.swift
//  VIPERS-CommandBus
//
//  Created by Jan Bartel on 04/11/2016.
//  Copyright (c) 2016 Jan Bartel. All rights reserved.
//

import UIKit
import VIPERS_CommandBus

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        //create a command bus
        let commandBus = CommandBus()
        
        //add your example handler to your command bus
        let commandHandler = ExampleCommandHandler()
        commandBus.addHandler(commandHandler)
        
        //create your command
        let command = ICommandYouToSaySomething()
        
        try! commandBus.process(command) { (result: String?, error: ErrorType?) in
            let message = result
            print("message: '\(message!)'")
        }
        
        return true
    }

}

