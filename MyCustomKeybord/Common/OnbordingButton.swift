//
//  OnbordingButton.swift
//  MyCustomKeybord
//
//  Created by Trainee Alex on 18.05.2021.
//

import UIKit

class OnbordingButton: UIButton {
    
    private var color: UIColor = #colorLiteral(red: 0.3515330553, green: 0.6099658608, blue: 0.8699855208, alpha: 1)
    private var textColor: UIColor = .white
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
        titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        
        layer.cornerRadius = 6
        clipsToBounds = true
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

