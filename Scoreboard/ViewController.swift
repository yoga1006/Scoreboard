//
//  ViewController.swift
//  Scoreboard
//
//  Created by Yoga on 2022/5/18.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var player1TextField: UITextField!
    @IBOutlet weak var player2TextField: UITextField!
    
    @IBOutlet weak var gameset1Label: UILabel!
    @IBOutlet weak var gameset2Label: UILabel!
    
    @IBOutlet weak var score1Label: UILabel!
    @IBOutlet weak var score2Label: UILabel!
    
    @IBOutlet weak var serve1Label: UILabel!
    @IBOutlet weak var serve2Label: UILabel!
    
    
    @IBOutlet weak var winLabel: UILabel!
   
    //設定球數
    var ballCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initfunc()
        gameset1Label.text="0"
        gameset2Label.text="0"
        serve1Label.text="Serve"
        serve2Label.text=""
        view.backgroundColor = UIColor(red: 100/255, green: 149/255, blue: 237/255, alpha: 1)
    }

    //初始設定
    func initfunc(){
        winLabel.isHidden = true
        score1Label.text="0"
        score2Label.text="0"
        ballCount = 0
        
    }
    
    //換發球權當輪到player1做為發球開局時
    func changeServeplayer1(){
        //當球數為以下時，交換發球方，為player2
        if ballCount == 2 || ballCount == 3 || ballCount == 6 || ballCount == 7 || ballCount == 10 || ballCount == 11 || ballCount == 14 || ballCount == 15 || ballCount == 18 || ballCount == 19 {
                
                serve2Label.text = "Serve"
                serve1Label.text = ""
                view.backgroundColor = UIColor(red: 124/255, green: 205/255, blue: 124/255, alpha: 1)
                
        }else  {
                
                serve1Label.text = "Serve"
                serve2Label.text = ""
                view.backgroundColor = UIColor(red: 100/255, green: 149/255, blue: 237/255, alpha: 1)
                
            }
            
        }
    
    //換發球權當輪到player2做為發球開局時
    func changeServePlayer2(){
        ////當球數為以下時，交換發球方，為player2
        if ballCount == 1 || ballCount == 4 || ballCount == 5 || ballCount == 8 || ballCount == 9 || ballCount == 12 || ballCount == 13 || ballCount == 16 || ballCount == 17 || ballCount == 20  {
                
                serve2Label.text = "Serve"
                serve1Label.text = ""
                view.backgroundColor = UIColor(red: 124/255, green: 205/255, blue: 124/255, alpha: 1)
                
        }else  {
                
                serve1Label.text = "Serve"
                serve2Label.text = ""
                view.backgroundColor = UIColor(red: 100/255, green: 149/255, blue: 237/255, alpha: 1)
                
            }
        
    }
    
    //局數跟分數的設定
    func setGame(){
        
        
        if score1Label.text == "11" {
            let set1 = Int(gameset1Label.text!)
            let set1number = set1! + 1
            gameset1Label.text = String(set1number)
            
            if set1number == 4 {
               gameset1Label.text = String(set1number)
               winLabel.isHidden = false
               winLabel.text = player1TextField.text!+"恭喜獲勝"+"🎊"
               
           }
            
        }
        
        if score2Label.text == "11" {
            let set2 = Int(gameset2Label.text!)
            let set2number = set2!+1
            gameset2Label.text = String(set2number)
            
            
            if set2number == 4 {
                gameset2Label.text = String(set2number)
                winLabel.isHidden = false
                winLabel.text = player2TextField.text!+"恭喜獲勝"+"🎊"
                
            }
            
            
        }
        
        let gamesettemp1 = Int(gameset1Label.text!)
        let gamesettemp2 = Int(gameset2Label.text!)
        let gameset = gamesettemp1!+gamesettemp2!
        //當整體遊戲局數為下時，發球方為player1
        if gameset == 0 || gameset == 2 || gameset == 4 || gameset == 6 {
            changeServeplayer1()
        }else{
            changeServePlayer2()
        }
        
    }
    
    //player1名字
    @IBAction func player1name(_ sender: UITextField) {
        let player1 = player1TextField.text!
        sender.text=player1
    }
    //player2名字
    @IBAction func player2name(_ sender: UITextField) {
        let player2 = player2TextField.text!
        sender.text=player2
    }
    
    //選手1獲勝（即當按選手下方button＋時）
    @IBAction func player1win(_ sender: UIButton) {
        //球數會加1
        ballCount = ballCount+1
        let score1 = Int(score1Label.text!)
        let player1score = score1!+1
        score1Label.text = String(player1score)
        setGame()
        if player1score > 11 {
           initfunc()
        }
    
    }

    
    //選手2獲勝（即當按選手下方button＋時）
    @IBAction func player2win(_ sender: UIButton) {
        //球數會加1
        ballCount = ballCount+1
        let score2 = Int(score2Label.text!)
        let player2score = score2!+1
        score2Label.text = String(player2score)
        setGame()
        if player2score > 11 {
            initfunc()
        }
    }
    
    //清除所有數值按鈕
    @IBAction func resetAll(_ sender: Any) {
        initfunc()
        gameset1Label.text="0"
        gameset2Label.text="0"
        serve1Label.text="Serve"
        serve2Label.text=""
        view.backgroundColor = UIColor(red: 100/255, green: 149/255, blue: 237/255, alpha: 1)
    }
    
    //分數換邊
    @IBAction func changeside(_ sender: UIButton) {
        let score1temp = score1Label.text!
        score1Label.text = score2Label.text
        score2Label.text = score1temp
        
    }
    
    //按畫面任一處收鍵盤
    @IBAction func closeKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
}

