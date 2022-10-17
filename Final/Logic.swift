//
//  Vlad Vitalaru
//  Besim Krnjic
//
//  Logic.swift
//  Final
//
// This file includes all the backend logic for the game

import Foundation

class logic {
    var locations = ["Germany-1","France-1","Italy-1","Poland","Russia","Spain","Estonia","Ireland-1","UK","US-1","Romania-1","japan-1","china-1","canada-1","Bosnia-1","greece-1","croatia-1","ukraine","sweden-1","belgium-1","hungary-1"]
    // Country flags
    var countries = ["germany", "france", "italy","poland-1","russia-1","spain-1","estonia-1","ireland","uk-1","us","romania","japan","China","canada","bosnia","greece","croatia","ukraine-1","sweden","belgium","hungary"]

    var index = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20] //Index values of location pictures in use
    let flagIndex = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    var answer = Int.random(in:0...2)
    var numbers = [0,1,2].shuffled()
    var Score = 0
    var correct = "    "
    var showAlert = false
    var wrong = false

    func flagTap(_ tag: Int) -> Int { //Function that handles user response
        if tag == answer {
            Score += 1
            wrong = false
            correct = "Correct"
        } else {
            wrong = true
            correct = "Wrong"
        }
        let check = buildArray(answer)
        return check
    }
    
    func buildArray(_ val: Int) -> Int{ //Function that deals with displaying new flags and country images
        if index.count == 1 {
            return 1
        }
        index = index.filter(){$0 != answer}
        answer = index.randomElement()!
        numbers = []
        numbers.append(answer)
        while numbers.count < 3 {
            let temp = (flagIndex[Int.random(in: 0...20)])
            if !numbers.contains(temp) {
                numbers.append(temp)
            }
        }
        numbers.shuffle()
        return 0
    }
    
    func newGame() { //Function that initializes a new game
        index = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
        answer = 2
        numbers = [0,1,2]
        Score = 0
        correct = "     "
        return
    }
}
