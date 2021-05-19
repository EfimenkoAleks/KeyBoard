//
//  KeyboardOtherButton.swift
//  EfKeyboard
//
//  Created by Trainee Alex on 19.05.2021.
//

import UIKit

class KeyboardOtherButton: UIButton {
    
    private var color: UIColor = #colorLiteral(red: 0.9820628762, green: 0.6610819697, blue: 0.5591307878, alpha: 1)
    private var textColor: UIColor = .black
    private let touchDownAlpha: CGFloat = 0.3
    private weak var timer: Timer?
    private let timerStep: TimeInterval = 0.01
    private let animateTime: TimeInterval = 0.4
    private lazy var alphaStep: CGFloat = {
        return (1 - touchDownAlpha) / CGFloat(animateTime / timerStep)
    }()
    
    func setup() {
        backgroundColor = .clear
        layer.backgroundColor = color.cgColor
        tintColor = textColor
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        clipsToBounds = true
        
        layer.cornerRadius = 6
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1).cgColor
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
        layer.masksToBounds = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let backgroundColor = backgroundColor {
            color = backgroundColor
            
        }
        
        setup()
    }
    
    convenience init(color: UIColor? = nil, title: String? = nil) {
        self.init(type: .custom)
        
        if let color = color {
            self.color = color
            
        }
        
        if let title = title {
            setTitle(title, for: .normal)
        }
        
        setup()
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                touchDown()
            } else {
                cancelTracking(with: nil)
                touchUp()
            }
        }
    }
    
    func touchUp() {
        timer = Timer.scheduledTimer(timeInterval: timerStep,
                                     target: self,
                                     selector: #selector(animation),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func animation() {
        guard let backgroundAlpha = layer.backgroundColor?.alpha else {
            stopTimer()
            
            return
        }
        
        let newAlpha = backgroundAlpha + alphaStep
        
        if newAlpha < 1 {
            layer.backgroundColor = color.withAlphaComponent(newAlpha).cgColor
        } else {
            layer.backgroundColor = color.cgColor
            
            stopTimer()
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    func touchDown() {
        stopTimer()
        
        layer.backgroundColor = color.withAlphaComponent(touchDownAlpha).cgColor
    }
    
    deinit {
        stopTimer()
    }
    
}


