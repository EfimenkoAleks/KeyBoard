//
//  KeyboardViewController.swift
//  EfKeyboard
//
//  Created by Trainee Alex on 14.05.2021.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    var shiftStatus: Int = 0 //0 - off, 1 - on, 2 - caps lock
    
    @IBOutlet weak var row1: UIStackView!
    @IBOutlet weak var row2: UIStackView!
    @IBOutlet weak var row3: UIStackView!
    @IBOutlet weak var row4: UIStackView!
    
    @IBOutlet weak var numberSet: UIStackView!
    @IBOutlet weak var charSet: UIStackView!
    @IBOutlet weak var shiftButton: UIButton!
    
    private var proxy: UITextDocumentProxy {
        return textDocumentProxy
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
       
    }
    
    @IBAction func shiftPressed(sender: UIButton) {
        shiftStatus = shiftStatus > 0 ? 0 : 1
        
        shiftChange(conteinerView: row1)
        shiftChange(conteinerView: row2)
        shiftChange(conteinerView: row3)
    }
    
    @IBAction func keyPressed(sender: UIButton) {
        let string = sender.titleLabel!.text
        proxy.insertText("\(string!)")
        
        if shiftStatus == 1 {
            shiftPressed(sender: self.shiftButton)
            
            UIView.animate(withDuration: 0.2) {
                sender.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            } completion: { (_) in
                sender.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }

        }
    }
    
    @IBAction func charSetPressed(sender: UIButton) {
        if sender.titleLabel!.text == "!@#" {
            numberSet.isHidden = true
            charSet.isHidden = false
            sender.setTitle("123", for: .normal)
        } else {
            numberSet.isHidden = false
            charSet.isHidden = true
            sender.setTitle("!@#", for: .normal)
        }
    }
    
    @IBAction func backSpacePressed(sender: UIButton) {
        proxy.deleteBackward()
    }
    @IBAction func dotPressed(sender: UIButton) {
        proxy.insertText(".")
    }
    
    @IBAction func returnPressed(sender: UIButton) {
        proxy.insertText("\n")
    }
    
    @IBAction func spacePressed(sender: UIButton) {
        proxy.insertText(" ")
    }
    
    @IBAction func shiftDoubleTapped(sender: UITapGestureRecognizer) {
        shiftStatus = 2
        shiftChange(conteinerView: row1)
        shiftChange(conteinerView: row2)
        shiftChange(conteinerView: row3)
    }
    
    @IBAction func shiftTrippleTapped(sender: UITapGestureRecognizer) {
        shiftStatus = 0
        shiftPressed(sender: self.shiftButton)
    }
    
    func shiftChange(conteinerView: UIStackView) {
        for view in conteinerView.subviews {
            if let button = view as? UIButton {
                let buttonTitle = button.titleLabel!.text
                if shiftStatus == 0 {
                    let text = buttonTitle!.lowercased()
                    button.setTitle("\(text)", for: .normal)
                } else {
                    let text = buttonTitle!.uppercased()
                    button.setTitle("\(text)", for: .normal)
                }
            }
        }
    }
    
    override func loadView() {
        let nib = UINib(nibName: "KeyboardViewController", bundle: nil)
        let objects = nib.instantiate(withOwner: self, options: nil)
        guard let keyboardView = objects[0] as? UIView else { return }
        view = keyboardView
        
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: self.view.bounds.width),
            view.heightAnchor.constraint(equalToConstant: 270)
        
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  //      self.charSet.isHidden = true
  //      self.numberSet.isHidden = true
    }
    
    override func viewWillLayoutSubviews() {
       
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
     
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
       
    }


}
