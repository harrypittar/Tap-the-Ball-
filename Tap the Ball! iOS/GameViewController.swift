//
//  GameViewController.swift
//  Tap the Ball! iOS
//
//  Created by Harry Pittar, Lauren Eddington, Trent Lim, Hannah O'Connor on 25/05/21.
//
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    /// Calls viewDidLoad function
    override func viewDidLoad() {
        super.viewDidLoad()
        

        ///Load the SKScene from 'GameScene.sks'
        if let view = self.view as! SKView? {
            
            if let scene = GameScene(fileNamed: "GameScene") {
                /// Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                scene.size = view.bounds.size
                
                /// Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }

    ///
    override var shouldAutorotate: Bool {
        return true
    }
    
    
    /// Sets all orientations of the screen to rotate left or right.
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    /// Release any cached data, images, etc that aren't in use. **/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    /// Hides status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
