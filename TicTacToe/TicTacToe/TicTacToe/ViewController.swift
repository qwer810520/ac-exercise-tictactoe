//
//  ViewController.swift
//  TicTacToe
//
//  Created by 楷岷 張 on 2017/3/1.
//  Copyright © 2017年 Min. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var player = 1
    var game = [0,0,0,0,0,0,0,0,0]
    var gameStart = true
    let winner = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var whoWin = 0
    
    @IBOutlet weak var message: UILabel!
    
    @IBAction func buttonArray(_ sender: UIButton) {
//        不要下在重複的地方
        if game[sender.tag - 1] == 0 && gameStart == true {
//        可以下圈圈叉叉
            if player == 1 {
                sender.setTitle("O", for: .normal)
                message.text = "Player1!!"
//         插入數字到game陣列裡
                game[sender.tag - 1] = 1
                player = 2
            }else if player == 2 {
                sender.setTitle("X", for: .normal)
                message.text = "Player2!!"
//         插入數字到game陣列裡
                game[sender.tag - 1] = 2
                player = 1
        }
      }
        winnerConditions()
    }
    
    func winnerConditions() {
        for win in winner {
            if game[win[0]] != 0 && game[win[0]] == game[win[1]] && game[win[1]] == game[win[2]] {
                if game[win[0]] == 1 {
                    message.text = "Player1 winner!!"
                    whoWin = 1
                    gameStart = false
                }else if game[win[0]] == 2 {
                    message.text = "Player2 winner!!"
                    whoWin = 2
                    gameStart = false
                    
                }
            }
        }
        gameStart = false
        for x in game {
            if x == 0 && whoWin == 0 {
                gameStart = true
            }
        }
        if gameStart == false && whoWin == 1 {
           message.text = "Player1 winner!!"
        }else if gameStart == false && whoWin == 0 {
            message.text = "Draw!!"
        }
        
    }

    @IBAction func playAgain(_ sender: Any) {
        player = 1
        game = [0,0,0,0,0,0,0,0,0]
        gameStart = true
        message.text = "Start game!!"
        whoWin = 0
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

