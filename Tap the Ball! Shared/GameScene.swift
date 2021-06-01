//
//  GameScene.swift
//  Tap the Ball! Shared
//
//  Created by Harry Pittar on 25/05/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var scoreLabel = SKLabelNode()
    var highscoreLabel = SKLabelNode()
    var score = 0
    var highscore = 0
    
    var dx = 10
    var dy = 10

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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        //let level = 3
        
        
        
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
    
    
    override func update(_ currentTime: TimeInterval){
        


    }
    
}
    
    
    

    

    

    

