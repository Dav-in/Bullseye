//
//  Game.swift
//  Bullseye
//
//  Created by Davin Henrik on 12/1/21.
//
//Single Responsibility Principle

//Game's job: Provide the data model for the app.

import Foundation

 // data model for the app

struct Game {
    
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    // method to calculate the user's points
    
    func points(sliderValue: Int) -> Int {
        // return the absolute value of the difference below
         100 - abs(self.target - sliderValue)
    }
    
}
