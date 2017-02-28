//
//  ViewController.swift
//  TicTacToe
//
//  Created by 楷岷 張 on 2017/2/25.
//  Copyright © 2017年 Min. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var message: UILabel!
    var player = 1
    var game = [0,0,0,0,0,0,0,0,0]
    
    let winner = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var y = true
    @IBAction func arrayButton(_ sender: UIButton) {
        if game[sender.tag - 1] == 0 && y == true {
            game[sender.tag - 1] = player
        if player == 1 {
            sender.setTitle("O", for: .normal)
            message.text = "Player1!!"
            player = 2
        } else if player == 2 {
            sender.setTitle("X", for: .normal)
             message.text = "Player2!!"
            player = 1
        }
    }
        for x in winner {
            if game[x[0]] != 0 && game[x[0]] == game[x[1]] && game[x[1]] == game[x[2]] {
                if game[x[0]] == 1 {
                message.text = "Player1 winner!!"
                y = false
            } else if game[x[0]] == 2 {
                message.text = "Player2 winner!!"
                y = false
                
            }
    
            }
            
    
    }
        if y == false {
        message.text = "Draw!!"
        }
        
    }
    
    @IBAction func playAgain(_ sender: Any) {
        player = 1
        game = [0,0,0,0,0,0,0,0,0]
        y = true
        message.text = "Start Game!"
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setTitle(nil, for: .normal)
        }

    }
   
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

