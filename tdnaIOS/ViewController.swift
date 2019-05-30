//
//  ViewController.swift
//  tdnaIOS
//
//
//  @version 3.0
//  @author Raul Popa & Stefan Endres
//  @copyright TypingDNA Inc. https://www.typingdna.com
//  @license http://www.apache.org/licenses/LICENSE-2.0
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import UIKit
import NotificationCenter

class ViewController: UIViewController {

    var tdna = TypingDNARecorderMobile();

    override func viewDidLoad() {
        super.viewDidLoad();
        //Adding text field target for recording typing pattern. Typing patterns are recorded only on this field(s).
        TypingDNARecorderMobile.addTarget(textField);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var textField: UITextField!
    
    
    /**
    * EXAMPLE:
    * typingPattern:String = TypingDNARecorderMobile.getTypingPattern(type, length, text, textId, target, caseSensitive);
    *
    * PARAMS:
    * type:Int = 0; // 1,2 for diagram pattern (short identical texts - 2 for extended diagram), 0 for any-text typing pattern (random text)
    * length:Int = 0; // (Optional) the length of the text in the history for which you want the typing pattern, 0 = ignore
    * text:String = ""; // (Only for type 1/2) a typed string that you want the typing pattern for
    * textId:Int = 0; // (Optional, only for type 1/2) a personalized id for the typed text, 0 = ignore
    * target:UITextField = nil; // (Optional, only for type 1/2) Get a typing pattern only for text typed in a certain text field.
    * caseSensitive:Bool = false; // (Optional, only for type 1/2) Used only if you pass a text for type 1/2
    */
    
    // Get type 1 pattern. Recommended on mobile, for sensitive fixed texts (passwords/pins).
    @IBAction func type1Btn(_ sender: UIButton) {
        //let str = textField.text!; let typingPattern = TypingDNARecorderMobile.getTypingPattern(1, 0, str, 0);
        let typingPattern = TypingDNARecorderMobile.getTypingPattern(1, 0, "", 0, textField);
        print("Type 1: ", typingPattern);
    }
    
    // Get type 2 pattern. Recommended on mobile, for non-sensitive fixed texts.
    @IBAction func type2Btn(_ sender: UIButton) {
        let typingPattern = TypingDNARecorderMobile.getTypingPattern(2, 0, "", 0, textField);
        print("Type 2: ", typingPattern);
    }
    
    // Get type 0 pattern (anytext pattern). NOT recommended on mobile version because it needs 120+ chars to work well.
    @IBAction func type0Btn(_ sender: UIButton) {
        let typingPattern = TypingDNARecorderMobile.getTypingPattern(0, 0, "", 0);
        print("Type 0: ",typingPattern);
    }
    
    @IBAction func resetBtn(_ sender: UIButton) {
        textField.text = "";
        TypingDNARecorderMobile.reset(true);
    }
    
}

