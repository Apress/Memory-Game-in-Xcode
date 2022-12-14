//
//  ViewController.swift
//  MemoryGame
//
//  Created by Tihomir RAdeff on 6.10.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button16: UIButton!
    
    @IBOutlet weak var button17: UIButton!
    @IBOutlet weak var button18: UIButton!
    @IBOutlet weak var button19: UIButton!
    @IBOutlet weak var button20: UIButton!
    
    @IBOutlet weak var button21: UIButton!
    @IBOutlet weak var button22: UIButton!
    @IBOutlet weak var button23: UIButton!
    @IBOutlet weak var button24: UIButton!
    
    var imagesArray = [
        "image1",
        "image2",
        "image3",
        "image4",
        "image5",
        "image6",
        "image7",
        "image8",
        "image9",
        "image10",
        "image11",
        "image12",
        "image1",
        "image2",
        "image3",
        "image4",
        "image5",
        "image6",
        "image7",
        "image8",
        "image9",
        "image10",
        "image11",
        "image12"
    ]
    
    var buttons = [UIButton]()
    
    var clickNumber = 1
    
    var click1Value = 0
    var click2Value = 0
    
    var currentPlayer = 1
    
    var player1Points = 0
    var player2Points = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //shuffle the tiles
        imagesArray.shuffle()
        
        //add buttons to an array
        buttons.append(button1)
        buttons.append(button2)
        buttons.append(button3)
        buttons.append(button4)
        
        buttons.append(button5)
        buttons.append(button6)
        buttons.append(button7)
        buttons.append(button8)
        
        buttons.append(button9)
        buttons.append(button10)
        buttons.append(button11)
        buttons.append(button12)
        
        buttons.append(button13)
        buttons.append(button14)
        buttons.append(button15)
        buttons.append(button16)
        
        buttons.append(button17)
        buttons.append(button18)
        buttons.append(button19)
        buttons.append(button20)
        
        buttons.append(button21)
        buttons.append(button22)
        buttons.append(button23)
        buttons.append(button24)
        
        //enable buttons
        for button in buttons {
            button.isUserInteractionEnabled = true
        }
    }
    
    // MARK: - Button Clicks

    //row 1
    @IBAction func button1Action(_ sender: Any) {
        buttonClick(button: button1, image: 0)
    }
    
    @IBAction func button2Action(_ sender: Any) {
        buttonClick(button: button2, image: 1)
    }
    
    @IBAction func button3Action(_ sender: Any) {
        buttonClick(button: button3, image: 2)
    }
    
    @IBAction func button4Action(_ sender: Any) {
        buttonClick(button: button4, image: 3)
    }
    
    //row 2
    @IBAction func button5Action(_ sender: Any) {
        buttonClick(button: button5, image: 4)
    }
    
    @IBAction func button6Action(_ sender: Any) {
        buttonClick(button: button6, image: 5)
    }
    
    @IBAction func button7Action(_ sender: Any) {
        buttonClick(button: button7, image: 6)
    }
    
    @IBAction func button8Action(_ sender: Any) {
        buttonClick(button: button8, image: 7)
    }
    
    //row 3
    @IBAction func button9Action(_ sender: Any) {
        buttonClick(button: button9, image: 8)
    }
    
    @IBAction func button10Action(_ sender: Any) {
        buttonClick(button: button10, image: 9)
    }
    
    @IBAction func button11Action(_ sender: Any) {
        buttonClick(button: button11, image: 10)
    }
    
    @IBAction func button12Action(_ sender: Any) {
        buttonClick(button: button12, image: 11)
    }
    
    //row 4
    @IBAction func button13Action(_ sender: Any) {
        buttonClick(button: button13, image: 12)
    }
    
    @IBAction func button14Action(_ sender: Any) {
        buttonClick(button: button14, image: 13)
    }
    
    @IBAction func button15Action(_ sender: Any) {
        buttonClick(button: button15, image: 14)
    }
    
    @IBAction func button16Action(_ sender: Any) {
        buttonClick(button: button16, image: 15)
    }
    
    //row 5
    @IBAction func button17Action(_ sender: Any) {
        buttonClick(button: button17, image: 16)
    }
    
    @IBAction func button18Action(_ sender: Any) {
        buttonClick(button: button18, image: 17)
    }
    
    @IBAction func button19Action(_ sender: Any) {
        buttonClick(button: button19, image: 18)
    }
    
    @IBAction func button20Action(_ sender: Any) {
        buttonClick(button: button20, image: 19)
    }
    
    //row 6
    @IBAction func button21Action(_ sender: Any) {
        buttonClick(button: button21, image: 20)
    }
    
    @IBAction func button22Action(_ sender: Any) {
        buttonClick(button: button22, image: 21)
    }
    
    @IBAction func button23Action(_ sender: Any) {
        buttonClick(button: button23, image: 22)
    }
    
    @IBAction func button24Action(_ sender: Any) {
        buttonClick(button: button24, image: 23)
    }
    
    // MARK: - Logic
    
    func buttonClick(button: UIButton, image: Int) {
        if clickNumber == 1 {
            button.setImage(UIImage(named: imagesArray[image]), for: .normal)
            clickNumber = 2
            click1Value = image + 1
        } else if clickNumber == 2 {
            button.setImage(UIImage(named: imagesArray[image]), for: .normal)
            clickNumber = 1
            click2Value = image + 1
            
            //check if the tiles are the same
            compareTiles()
        }
    }
    
    func switchPlayer() {
        if currentPlayer == 1 {
            currentPlayer = 2
            
            player1Label.textColor = .systemGray
            player2Label.textColor = .label
        } else if currentPlayer == 2 {
            currentPlayer = 1
            
            player1Label.textColor = .label
            player2Label.textColor = .systemGray
        }
    }
    
    func compareTiles() {
        //disable buttons
        for button in buttons {
            button.isUserInteractionEnabled = false
        }
        
        if imagesArray[click1Value-1] == imagesArray[click2Value-1] {
            //same images
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
                //remove tiles
                self.buttons[self.click1Value-1].alpha = 0
                self.buttons[self.click2Value-1].alpha = 0
                
                //enable buttons
                for button in self.buttons {
                    button.isUserInteractionEnabled = true
                }
                
                //points
                if self.currentPlayer == 1 {
                    self.player1Points = self.player1Points + 1
                    self.player1Label.text = "Player 1: \(self.player1Points)"
                } else if self.currentPlayer == 2 {
                    self.player2Points = self.player2Points + 1
                    self.player2Label.text = "Player 2: \(self.player2Points)"
                }
            })
        } else {
            //different images
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
                //flip tiles
                self.buttons[self.click1Value-1].setImage(UIImage(named: "tile"), for: .normal)
                self.buttons[self.click2Value-1].setImage(UIImage(named: "tile"), for: .normal)
                
                self.switchPlayer()
                
                //enable buttons
                for button in self.buttons {
                    button.isUserInteractionEnabled = true
                }
            })
        }
    }
}

