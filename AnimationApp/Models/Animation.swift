//
//  Animation.swift
//  AnimationApp
//
//  Created by Andrey Sandler on 02.11.2022.
//

import Foundation

struct Animation {
    let preset: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    
    static func getAnimation() -> [Animation] {
        var animations: [Animation] = []
        
        let presets = DataStore.shared.presets
        let curves = DataStore.shared.curves
        let forces = Double.random(in: 1...1.3)
        let durations = Double.random(in: 0.8...1.1)
        let delays = Double.random(in: 0...0.3)
        
        let iterationCount = min(
            presets.count,
            curves.count
        )
        
        for index in 0..<iterationCount {
            animations.append(
                Animation(
                    preset: presets[index],
                    curve: curves[index],
                    force: forces,
                    duration: durations,
                    delay: delays
                )
            )
        }
        return animations
    }
}
