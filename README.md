# VIPERS-CommandBus

[![Platform](https://img.shields.io/cocoapods/p/VIPERS-CommandBus.svg?style=flat)](http://cocoapods.org/pods/VIPERS-CommandBus)


# VIPERS-CommandBus-Protocol

Protocols of the command bus / message bus implementation used by VIPERS. These protocols are used to implement the interactor layer in the VIPERS ios application framework.

## What is a command bus ?
Have a look at this [blog post](http://php-and-symfony.matthiasnoback.nl/2015/01/a-wave-of-command-buses/) (It's example is written in PHP but I think you will accept this challenge)

## What is VIPER

VIPER is an application architecture for mobile app development.
You can find some explanations here: [Blogpost from objc.io] (https://www.objc.io/issues/13-architecture/viper/)  (It's example is written in OBJ-C but I think you will accept this as your next challenge :-P)

## Usage

### CommandBus
* To create a CommandHandler: Just implement the CommandHandlerProtocol. We have prepared a simple example in the example project of this pod for you.
* To use a command bus just use the CommandBus class. We have prepared a simple example in the example project of this pod for you.
* To create a command: Just use any object which you think is appropriate and which fullfils swifts Any type (As you might guess you find a simple Example in our example project) 

### Usage in some short lines

#### Create a command

```swift
struct ICommandYouToSaySomething{
    //...
}
```

#### Create a command handler for your command 

```swift
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

}
```

#### Add your command handler to your commandBus and process your command

```swift
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

```

## FAQ

### The command handler uses generics, what shall I do?

Don't be a sissy ... 

Just use them, they gurantee you that swift creates an runtime exception when you choose the wrong result type.

```swift
class ExampleCommandHandler : CommandHandlerProtocol{
    // ...
    func process<T>(command: Any!, completion: ((result: T?, error: ErrorType?) -> Void)?)  throws{
        //...
        // the ' as! T' part is the important player to double check your result 
        completion?(result: (messageIWouldLikeToSay as! T),error:nil)
    }
}
```

If you are not used to generics you ignore the checking can implement the command handler like that:

```swift
// use the following method in your command handler
func process(command: Any!, completion: ((result: Any?, error: ErrorType?) -> Void)?) throws{

    let messageIWouldLikeToSay = "Hello World"

    completion?(result: messageIWouldLikeToSay,error:nil)

}
```

## Requirements
iOS 8 is needed !!

## Installation

VIPERS-CommandBus is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:


```ruby
pod "VIPERS-CommandBus"
```

## Author

Jan Bartel, barteljan@yahoo.de

## License

VIPERS-CommandBus is available under the MIT license. See the LICENSE file for more info.
