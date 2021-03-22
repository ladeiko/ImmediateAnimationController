//
//  ImmediateAnimationController.swift
//
//  Created by Siarhei Ladzeika on 6/26/17.
//  Copyright © 2017 Siarhei Ladzeika. All rights reserved.
//

import UIKit

open class ImmediateAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    public static let shared = ImmediateAnimationController()

    public var modalPresentationStylesToCallAppearanceHooks: [UIModalPresentationStyle] = [.fullScreen, .overFullScreen]

    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.0
    }

    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let fromView = fromViewController.view!
        let toView = toViewController.view!

        let containerView = transitionContext.containerView
        let isPresenting = toViewController.presentingViewController == fromViewController

        if isPresenting {
            if modalPresentationStylesToCallAppearanceHooks.contains(toViewController.modalPresentationStyle) {
                fromViewController.beginAppearanceTransition(false, animated: false)
            }
            toViewController.beginAppearanceTransition(true, animated: false)
            containerView.addSubview(toView)
        }
        else {
            if modalPresentationStylesToCallAppearanceHooks.contains(fromViewController.modalPresentationStyle) {
                toViewController.beginAppearanceTransition(true, animated: false)
            }
            fromViewController.beginAppearanceTransition(false, animated: false)
            fromView.removeFromSuperview()
        }

        let wasCancelled = transitionContext.transitionWasCancelled
        if wasCancelled {
            toView.removeFromSuperview()
        }

        transitionContext.completeTransition(true)

        if isPresenting {
            toViewController.endAppearanceTransition()
            if modalPresentationStylesToCallAppearanceHooks.contains(toViewController.modalPresentationStyle) {
                fromViewController.endAppearanceTransition()
            }
        }
        else {
            fromViewController.endAppearanceTransition()
            if modalPresentationStylesToCallAppearanceHooks.contains(fromViewController.modalPresentationStyle) {
                toViewController.endAppearanceTransition()
            }
        }
    }
}

