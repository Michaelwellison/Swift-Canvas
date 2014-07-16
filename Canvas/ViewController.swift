//
//  ViewController.swift
//  Canvas
//
//  Created by Michael Ellison on 7/14/14.
//  Copyright (c) 2014 MichaelWEllison. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    // MARK: Properties
    
    @IBOutlet var soccerImage: UIImageView
    @IBOutlet var cleatImage: UIImageView
    @IBOutlet var soccerPlayerImage: UIImageView
    @IBOutlet var goalImage: UIImageView
    @IBOutlet var imagesContainer: UIView
    @IBOutlet var imageBarScrollView: UIScrollView
    
    
    var originalSoccerImageX = CGFloat(0.0)
    var originalSoccerImageY = CGFloat(0.0)
    var originalCleatImageX = CGFloat(0.0)
    var originalCleatImageY = CGFloat(0.0)
    var originalSoccerPlayerImageX = CGFloat(0.0)
    var originalSoccerPlayerImageY = CGFloat(0.0)
    var originalGoalImageX = CGFloat(0.0)
    var originalGoalImageY = CGFloat(0.0)
    
    
    
    var newImageView : UIImageView?
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureImageBarScrollView()
        configureImageContainer()
    }
    
    // MARK: Configuration

    func configureImageBarScrollView() {
        imageBarScrollView.contentSize = CGSize(width: 640, height: 70)
    }
    
    func configureImageContainer() {
        var fieldImageView = UIImageView(frame: CGRect(x: 340, y: soccerImage.frame.origin.y, width: soccerImage.frame.width, height: soccerImage.frame.height))
        var fieldImage = UIImage(named: "field")
        fieldImageView.image = fieldImage
        
        var soccerPlayerAndBallImageView = UIImageView(frame: CGRect(x: fieldImageView.frame.origin.x + 70, y: soccerImage.frame.origin.y, width: soccerImage.frame.width, height: soccerImage.frame.height))
        var soccerPlayerAndBallImage = UIImage(named: "soccerPlayerAndBall")
        soccerPlayerAndBallImageView.image = soccerPlayerAndBallImage
        
        var stadiumImageView = UIImageView(frame: CGRect(x: fieldImageView.frame.origin.x + 140, y: soccerImage.frame.origin.y, width: soccerImage.frame.width, height: soccerImage.frame.height))
        var stadiumImage = UIImage(named: "stadium")
        stadiumImageView.image = stadiumImage
        
        var trophyImageView = UIImageView(frame: CGRect(x: fieldImageView.frame.origin.x + 210, y: soccerImage.frame.origin.y, width: soccerImage.frame.width, height: soccerImage.frame.height))
        var trophyImage = UIImage(named: "trophy")
        trophyImageView.image = trophyImage
        
        imagesContainer.addSubview(fieldImageView)
        imagesContainer.addSubview(soccerPlayerAndBallImageView)
        imagesContainer.addSubview(stadiumImageView)
        imagesContainer.addSubview(trophyImageView)
        
    }
    
    // MARK: Actions
    
    @IBAction func onSoccerPanGesture(panGestureRecognizer: UIPanGestureRecognizer) {
        
        var translation = panGestureRecognizer.translationInView(view)
        var location = panGestureRecognizer.locationInView(view);
        
        if (panGestureRecognizer.state == UIGestureRecognizerState.Began) {
            println("Gesture began")
            
            originalSoccerImageX = soccerImage.frame.origin.x
            originalSoccerImageY = soccerImage.frame.origin.y
            
            println(soccerImage.frame.origin)
            
            newImageView = UIImageView()
            
            newImageView!.frame = CGRectMake(soccerImage.frame.origin.x, soccerImage.frame.origin.y, soccerImage.frame.width * 1.2, soccerImage.frame.height * 1.2)
            
            var soccerImage2 = UIImage(named: "soccerBall")
            newImageView!.image = soccerImage2
            imagesContainer.addSubview(newImageView)
            
            var newPanGesture = UIPanGestureRecognizer()
            
        
        } else if (panGestureRecognizer.state == UIGestureRecognizerState.Changed) {
            println("Gesture changed")
           
            newImageView!.frame = CGRectMake(originalSoccerImageX + translation.x, originalSoccerImageY + translation.y, newImageView!.frame.size.width, newImageView!.frame.size.height)
            
        } else if (panGestureRecognizer.state == UIGestureRecognizerState.Ended) {
            println("Gesture ended")
            newImageView!.frame.size = CGSize(width: soccerImage.frame.width, height: soccerImage.frame.height)
            
            println(location)
            
        }
    }
  
    
    @IBAction func onCleatPanGesture(panGestureRecognizer: UIPanGestureRecognizer) {
        
    }

    @IBAction func onSoccerPlayerGesture(panGestureRecognizer: UIPanGestureRecognizer) {
        
    }

    @IBAction func onGoalGesture(panGestureRecognizer: UIPanGestureRecognizer) {
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

