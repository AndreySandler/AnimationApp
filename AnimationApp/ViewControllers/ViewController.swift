//
//  ViewController.swift
//  AnimationApp
//
//  Created by Andrey Sandler on 02.11.2022.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var animationView: SpringView!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    @IBOutlet var runButton: UIButton!
    
    // MARK: - Public Properties
    private let animation: Animation = Animation.getAnimation()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels(animation)
    }
    
    // MARK: - IBActions
    @IBAction func runAnimationButtonDidTapped() {
        let animation = Animation.getAnimation()
        
        animationView.animation = animation.preset
        animationView.animate()
        setupLabels(animation)
    }
    
    // MARK: - Private Functions
    private func setupLabels(_ animation: Animation) {
        presetLabel.text = animation.preset
        curveLabel.text = animation.curve
        forceLabel.text = string(from: animation.force)
        durationLabel.text = string(from: animation.duration)
        delayLabel.text = string(from: animation.delay)
        runButton.setTitle("Run \(animation.preset)", for: .normal)
    }
    
    private func string(from double: Double) -> String {
        String(format: "%.2f", double)
    }
}

