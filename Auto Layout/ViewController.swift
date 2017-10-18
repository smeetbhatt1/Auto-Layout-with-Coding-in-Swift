//
//  ViewController.swift
//  Auto Layout
//
//  Created by smeetbhatt on 16/10/17.
//  Copyright © 2017 smeetbhatt. All rights reserved.
//

import UIKit

extension UIColor {
    static var lightBlue = UIColor(red: 173/255, green: 216/255, blue: 230/230, alpha: 1)
}
class ViewController: UIViewController {
    
    
    
    let bbImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "basketball"))
        
        //this enables autolayout for imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // for veiwing horizontally
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
       let textView = UITextView()
//        textView.text = " "
//        textView.font = UIFont.boldSystemFont(ofSize: 18)
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!",
                                                       attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = UIColor(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
        pc.pageIndicatorTintColor = .lightBlue
        return pc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        view.addSubview(bbImageView)
        view.addSubview(descriptionTextView)
        setupBBImageLayout()
        setupButtonControls()
    }
    
    fileprivate func setupButtonControls(){
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        view.addSubview(bottomControlsStackView)
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        NSLayoutConstraint.activate([
//            previousButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupBBImageLayout(){
        let topImageContainerView = UIView()
//        topImageContainerView.backgroundColor = .gray
        view.addSubview(topImageContainerView)
        
        //enable autolayout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(bbImageView)
        bbImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bbImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bbImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
//        topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        //constraint
//        bbImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        bbImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//        bbImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        bbImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    
        
        //TextViewDescription
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }

}

