//
//  MakeMeetingViewController.swift
//  copycopyroomroom
//
//  Created by 정재인 on 2020/03/12.
//

import UIKit


protocol sendTextDelegate{
    func sendText(data : String)
}

class MakeMeetingViewController : UIViewController{
    
    var sendDelegate : sendTextDelegate?
    
    lazy var textField: UITextField = { // Set x, y and width and height to place UITextField.
        view.backgroundColor = .white
        let width: CGFloat = 250
        let height: CGFloat = 50
        let posX: CGFloat = (self.view.bounds.width - width)/2
        let posY: CGFloat = (self.view.bounds.height - height)/2 // Create a UITextField.
        let textField = UITextField(frame: CGRect(x: posX, y: posY, width: width, height: height)) // Substitute the characters to be displayed.
        textField.text = "" // Set Delegate to itself
        textField.delegate = self // Display frame.
        textField.borderStyle = .roundedRect // Add clear button.
        textField.clearButtonMode = .whileEditing
        return textField
        
    }()
    
//    var delegate : MeetingListViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.textField)
    }
}

extension MakeMeetingViewController : UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField){
        self.dismiss(animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        sendDelegate?.sendText(data: textField.text!)
        self.dismiss(animated: true, completion: nil)
        return true
    }
}
