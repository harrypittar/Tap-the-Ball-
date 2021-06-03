//
//  GameScene.swift
//  Tap the Ball! Shared
//
//  Created by Harry Pittar on 25/05/21.
//

import SpriteKit
import GameplayKit

/// This is the GameScene class which is a bridge between the editor and the the code used to define the constraints of the game.
class GameScene: SKScene {
    /// Sets ball variable to sprite node
    var ball = SKSpriteNode()
    /// Sets scoreLabel variable to label node
    var scoreLabel = SKLabelNode()
    /// Sets highscoreLabel variable to label node
    var highscoreLabel = SKLabelNode()
    /// Starting score set to 0
    var score = 0
    /// Starting highscore set to 0
    var highscore = 0
    
    /// Sets the x vector as a velocity of 10
    var dx = 10
    /// Sets the y vector as a velocity of 10
    var dy = 10
    
    /// This function tells you when the scene is presented by a view.
    /// The ball and the score and highscore labels are assigned to variables, and create the border which the ball must stay within
    /// The function also updates the highscore when score > highscore
    override func didMove(to view: SKView) {
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        scoreLabel = self.childNode(withName: "score") as! SKLabelNode
        highscoreLabel = self.childNode(withName: "highscore") as! SKLabelNode
        scoreLabel.text = NSString(format: "Score : %i", score) as String
        
        let highscoreDefault =  UserDefaults.standard
        
        if (highscoreDefault.value(forKey: "Highscore") != nil) {
        highscore = highscoreDefault.value(forKey: "Highscore") as! NSInteger
        highscoreLabel.text = NSString(format: "Highscore : %i", highscore) as String
        
        }
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
    }
    
    /// This function detects when the screen has been touched.
    /// I can assign node.name to equal ball, meaning if the ball is touched, the if statement gets executed, which keeps track of the score.
    /// If the ball is touched, an impulse vector is also applied to the physics body of the ball.
    /// This makes it so that the ball bounces off into a random direction after each touch.
    /// If the score is greater than the highscore, the current highscore gets overriden with the new highscore
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        if let touch = touches.first {
            let location = touch.previousLocation(in: self)
            let node = self.nodes(at: location).first
            
 
            if node?.name == "ball" {
                score += 1
                ball.physicsBody?.applyImpulse(CGVector(dx: dx, dy: dy))
                
                if score % 5 == 1{
                    dx += 3
                    dy += 3
                }
                print(dy, dx)
                scoreLabel.text = NSString(format: "Score : %i", score) as String
            }else {
                score = 0
                ball.physicsBody?.isResting = true
                dx = 10
                dy = 10
                scoreLabel.text = NSString(format: "Score : %i", score) as String
                
                }
                
            
            
            if score > highscore {
                highscore = score
                highscoreLabel.text = NSString(format: "Highscore : %i", highscore) as String
                
                let highscoreDefault =  UserDefaults.standard
                
                highscoreDefault.set(highscore, forKey: "Highscore")
                
                highscoreDefault.synchronize()
                
                print("Congratulations! New high score of",highscore)
                
            }
      
           
        }
    }
    
    /// This is the update function which continously updates for each game tick.
    /// Currently we do not use this function, however it will be useful in future updates
    /// when increasing level difficulty regarding time taken to reach a specific score.
    override func update(_ currentTime: TimeInterval){
        


    }
    
}
    
    
    

    

    

    

