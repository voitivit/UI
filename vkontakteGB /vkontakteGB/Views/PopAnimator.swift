    //
    //  PopAnimator.swift
    //  vkontakteGB
    //
    //  Created by emil kurbanov on 24.05.2021.
    //
    
    import UIKit
    class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
        let duration = 1.0
        
        func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
            return duration
        }
        func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
            
            let source = transitionContext.viewController(forKey: .from)!
            let destination = transitionContext.viewController(forKey: .to)!
            
            
            let containerViewFrame = transitionContext.containerView.frame
            
            let sourceViewFrame = CGRect(
                x: containerViewFrame.width,
                y: 0,
                width: source.view.frame.height,
                height: source.view.frame.width
            )
            
            let destinationViewFrame = source.view.frame
            
            transitionContext.containerView.addSubview(destination.view)
            
            
            destination.view.frame = CGRect(
                x: -containerViewFrame.height,
                y: 0,
                width: source.view.frame.height,
                height: source.view.frame.width
            )
            
            UIView.animate(
                withDuration: duration,
                animations: {
                    source.view.frame = sourceViewFrame
                    source.view.transform = CGAffineTransform(rotationAngle: -.pi/2)
                    
                    destination.view.transform = .identity
                    destination.view.frame = destinationViewFrame
                    
                }) { finished in
                
                transitionContext.completeTransition(finished)
            }
        }
        
    }
    
