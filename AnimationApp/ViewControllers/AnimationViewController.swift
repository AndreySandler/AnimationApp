//
//  ViewController.swift
//  AnimationApp
//
//  Created by Andrey Sandler on 02.11.2022.
//

import UIKit
import SpringAnimation

class AnimationViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var animationView: SpringView!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    @IBOutlet var runButton: UIButton!
    
    // MARK: - Public Properties
    private var animation = Animation.getAnimation()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        setupCornerRadius()
    }
    
    // MARK: - IBActions
    @IBAction func runAnimationButtonDidTapped() {
        setupAnimation()
        setupLabels()
        animationView.animate()
        
        animation = Animation.getAnimation()
        runButton.setTitle("Run \(animation.preset)", for: .normal)
    }
    
    // MARK: - Private Functions
    private func setupAnimation() {
        animationView.animation = animation.preset
        animationView.curve = animation.curve
        animationView.force = animation.force
        animationView.duration = animation.duration
        animationView.delay = animation.delay
    }
    
    private func setupLabels() {
        presetLabel.text = animation.preset
        curveLabel.text = animation.curve
        forceLabel.text = string(from: animation.force)
        durationLabel.text = string(from: animation.duration)
        delayLabel.text = string(from: animation.delay)
    }
    
    private func setupCornerRadius() {
        animationView.layer.cornerRadius = 10
        runButton.layer.cornerRadius = 10
    }
    
    private func string(from double: Double) -> String {
        String(format: "%.2f", double)
    }
}

