//
//  CenteredUISlider.swift
//  CenteredUISlider
//
//  Created by M.A.R.G on 12/16/1399 AP.
//  Copyright © 1399 M.A.R.G. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
public class CenteredUISlider: UIView{
    
    private let leftSLider: UISlider = {
       let slider = UISlider()
       slider.translatesAutoresizingMaskIntoConstraints = false
       return slider
    }()
    private let rightSLider: UISlider = {
       let slider = UISlider()
       slider.translatesAutoresizingMaskIntoConstraints = false
       return slider
    }()
    private let mainSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.tintColor = .clear
        slider.addTarget(self, action: #selector(handleValuSLider), for: .valueChanged)
        return slider
    }()

    public var rangeValue: Float = 20 {
        didSet{
            initSliderValues()
        }
    }
    
    public var progressColor: UIColor = .systemBlue{
        didSet{
            initSlidersColors()
        }
    }

    public var getSLiderValue: ((Float) -> ())?
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setUpViews()
        initSliderValues()
        initSlidersColors()
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)

    }
     public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    fileprivate func setUpViews() {
        addSubview(leftSLider)
        addSubview(rightSLider)
        addSubview(mainSlider)
        
        leftSLider.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        leftSLider.trailingAnchor.constraint(equalTo: centerXAnchor).isActive = true
        leftSLider.topAnchor.constraint(equalTo: topAnchor).isActive = true
        leftSLider.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        rightSLider.leadingAnchor.constraint(equalTo: centerXAnchor).isActive = true
        rightSLider.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        rightSLider.topAnchor.constraint(equalTo: topAnchor).isActive = true
        rightSLider.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        mainSlider.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainSlider.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainSlider.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainSlider.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    fileprivate func initSliderValues() {
        leftSLider.minimumValue = 0
        leftSLider.maximumValue = rangeValue / 2
        leftSLider.value = rangeValue / 2
        
        rightSLider.minimumValue = rangeValue / 2
        rightSLider.maximumValue = rangeValue
        rightSLider.value = rangeValue / 2
        
        mainSlider.minimumValue = 0
        mainSlider.maximumValue = rangeValue
        mainSlider.value = rangeValue / 2
    }
    fileprivate func initSlidersColors() {

        leftSLider.minimumTrackTintColor = #colorLiteral(red: 0.8939959407, green: 0.8940270543, blue: 0.9021738172, alpha: 1)
        leftSLider.maximumTrackTintColor = progressColor
        
        rightSLider.minimumTrackTintColor = progressColor
        rightSLider.maximumTrackTintColor = #colorLiteral(red: 0.8939959407, green: 0.8940270543, blue: 0.9021738172, alpha: 1)
        
        rightSLider.setThumbImage(UIImage(), for: .normal)
        leftSLider.setThumbImage(UIImage(), for: .normal)
        
    }
    
    @objc private func handleValuSLider(slider: UISlider){
        let mediumValue = rangeValue / 2
        if slider.value >= mediumValue{
            rightSLider.value = slider.value
            leftSLider.value = mediumValue
        }else{
            leftSLider.value = slider.value
            rightSLider.value = 0
        }
        getSLiderValue?(slider.value - mediumValue)
    }
}
