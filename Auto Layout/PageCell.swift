//
//  PageCell.swift
//  Auto Layout
//
//  Created by smeetbhatt on 16/10/17.
//  Copyright © 2017 smeetbhatt. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell
{
    
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
    
    private func setupBBImageLayout(){
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        
        //enable autolayout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(bbImageView)
        bbImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bbImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bbImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        //        topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //        topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        //constraint
        //        bbImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //        bbImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        //        bbImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //        bbImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        //TextViewDescription
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBBImageLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
