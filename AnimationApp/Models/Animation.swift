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
    
    static func getAnimation() -> Animation {
        let presets = DataStore.shared.presets
        let curves = DataStore.shared.curves
        let iterationCount = min(
            presets.count,
            curves.count
        )
        
        let forces = (1...iterationCount).map( {_ in Double.random(in: 1...1.3)} )
        let durations = (1...iterationCount).map( {_ in Double.random(in: 0.8...1.1)} )
        let delays = (1...iterationCount).map( {_ in Double.random(in: 0...0.3)} )
        
        let animation = Animation(
                preset: presets.randomElement() ?? "",
                curve: curves.randomElement() ?? "",
                force: forces.randomElement() ?? 0,
                duration: durations.randomElement() ?? 0,
                delay: delays.randomElement() ?? 0
            )
        return animation
    }
}
