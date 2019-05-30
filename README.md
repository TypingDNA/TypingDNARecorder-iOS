# TypingDNA Recorder - iOS


## Table of contents

- About ​
- Overview ​
   - TypingDNARecorderMobile class ​
- Methods ​
   - TypingDNA.getTypingPattern (parameters) ​
   - TypingDNA.addTarget(UITextField) ​
   - TypingDNA.removeTarget(UITextField) ​
   - TypingDNA.reset() ​
   - TypingDNA.start() ​
   - TypingDNA.stop() ​
- Recommendations ​


## About

The recorder captures user’s typing patterns.

It does so by recording timings based on keydown and keyup events, but also motion data related to the typing behavior (accelerometer, gyroscope, orientation). Recording motion data is specific for the mobile recorder and does not apply for the JavaScript desktop recorder.

> **Note**​: The iOS version does not get the keydown events triggered through the events notification system, rather it uses some workarounds to capture them. Also, the recording might not work properly if emojis are used.


## Overview

Use TypingDNARecorderMobile recorder class to capture user's typing patterns.

First you need to import the file **TypingDNARecorderMobile.swift** in the app that wants to record a typing pattern. You will need to record typing patterns when a user first creates his account and again whenever you want to authenticate that user on your platform.

### TypingDNARecorderMobile class

Once you create an instance of the TypingDNARecorderMobile class, the user typing starts being recorded (as a history of key stroke events). Whenever you want to get the user's typing pattern you have to invoke .getTypingPattern method described in detail below.

```swift
class ViewController: UIViewController {
   var tdna = TypingDNARecorderMobile();
}
```

**Here are the methods of TypingDNARecorderMobile class:**

* getTypingPattern(parameters) ⇒ String
* addTarget(UITextField field)
* removeTarget(UITextField field)
* start()
* removeTarget()
* stop()
* reset()



## Methods

### a. TypingDNA.getTypingPattern (parameters)

This is the main function that outputs the user's typing pattern as a `String`

**Definition:**

```swift
static public func getTypingPattern(type:Int, length:Int, text:String, textId:Int, target:UITextField?, caseSensitive:Bool) -> String
```

Other definitions, overriding the main one:

```swift
static public func getTypingPattern(_ type:Int, _ length:Int, _ text:String, _ textId:Int, _ target:UITextField?, _ caseSensitive:Bool) -> String
```
```swift
static public func getTypingPattern(_ type:Int, _ length:Int, _ text:String, _ textId:Int, _ target:UITextField?) -> String
```
```swift
static public func getTypingPattern(_ type:Int, _ length:Int, _ text:String, _ textId:Int) -> String
```

**Returns:** A typing pattern in `String` form.

**Parameters:**

| Param         	| Type    	| Description                                                                                                                                                                                                                                                                                                                                                            	|
|---------------	|---------	|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	|
| type          	| `Int`     	| `0 for anytext pattern` (when you compare random typed texts of usually 120-180 chars long).​ `1 for sametext pattern` recommended in most cases, for emails, passwords, phone numbers, credit cards, short texts).​ `2 for extended pattern` (most versatile, can replace both anytext and sametext patterns. Best accuracy, recommended in cases where text is not a secret) 	|
| textid        	|`Int`     	| (Optional, only for type 1 and type 2) a personalized id for the typed text. 0 = ignore  	|
| text          	| `String`  	| (Only for type 1 and type 2) a string that you want the typing pattern for 	|
| length        	| `Int`     	| (Optional) the length of the text in the history for which you want the typing pattern, for type 0 is usually 140 or more. 0 = ignore	|
| target        	| `UITextField`  	| (Optional) specifies if pattern should be obtained only from text typed in a certain target. nil = ignore 	|
| caseSensitive 	| `Bool` 	| (Optional, default: false) Used if you pass a text for type 1 	|                                                                                                                                                                                                                                                                                	|

**Example:**
Example of getting type 1 typing pattern.

```swift
Int type = 1;
Int length = 0; //ignore this param, use default value
String text = "Please type this sentence to get authenticated.";
Int textId = 0; //ignore this param, use default value

let typingPattern = TypingDNARecorderMobile.getTypingPattern(type, length, text, textId, textField);
```
Example of getting type 1 typing pattern, with a custom textId and without a specific target.

```swift
Int type = 1;
Int length = 0; //ignore this param, use default value
String text = "Please type this sentence to get authenticated.";
Int textId = 12345;

let typingPattern = TypingDNARecorderMobile.getTypingPattern(type, length, text, textId);
```

### b. TypingDNA.addTarget(UITextField field)

Adds a target to the recorder. You can add multiple elements.
All the typing events will be recorded for this component.

**Definition:**
```swift
static public func addTarget(_ targetField:UITextField)
```

**Example:**

```swift
class ViewController: UIViewController {
   var tdna = TypingDNARecorderMobile();

   override func viewDidLoad() {
       super.viewDidLoad();
       // Adding text field target for recording typing pattern. Typing 
       patterns are recorded only on this field(s).
       TypingDNARecorderMobile.addTarget(textField);
   }
}
```

### c. TypingDNA.removeTarget(UITextField field)

Remove a target from the targetIds array.

**Definition:**
```swift
static public func removeTarget(_ targetField:UITextField)
```

### d. TypingDNA.reset(Bool all)

Resets the history stack of recorded typing events.

**Definition:**
```swift
static public func reset(_ all: Bool)
```

Other definition, with default value for all = false.
```swift
static public func reset()
```

### e. TypingDNA.start()

Automatically called at initialization. It starts the recording of typing events. You only have to call .start() to resume recording after a .stop()

**Definition:**
```swift
static public func start()
```

### f. TypingDNA.stop()

Ends the recording of further typing events. 

**Definition:**
```swift
static public func stop()
```

## Recommendations

We recommend that you deactivate **autocorrect** & **predictive features**  for the text field(s) you want to record on.

For mobile apps, we recommend you use  **type 1**  or **type 2**  typing patterns. The type 1/2 patterns work well with 15-30 chars of text, while type 0 pattern needs much more data to have good accuracy (120-150 chars of text).

For types 1/2 we recommend at least 3 enrolled patterns for a good accuracy.



