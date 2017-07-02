//
//  AppDetailViewController.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 7/1/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import UIKit
import Cosmos

class AppDetailViewController: UIViewController {
    
    var headerBG : UIView = {
        let whiteBG = UIView()
        whiteBG.backgroundColor = .white
        return whiteBG
    }()
    
    var app: App? {
        didSet{
            appDetails.attributedText = getAttributedStringForDesc(app: app!)
            
            if let price = app?.appCategory{
            
                getBtn.setTitle(price, for: .normal)
            }
            if let rating = app?.appRating{
                ratingBar.rating = rating
                ratingValue.text = "\(rating)"
            }
            
            if let url = app?.appPhoto{
                let url = URL(string: url)
                appIcon.kf.setImage(with: url)
            }
            
        }
    }
    
    
    var ratingBar: CosmosView = {
        let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        let rb = CosmosView()
        rb.rating = 4
        rb.settings.fillMode = .precise
        rb.settings.filledColor = lightGray
        rb.settings.emptyBorderColor = lightGray
        rb.settings.filledBorderColor = .white
        return rb
    }()
    
    var ratingValue : UILabel = {
        //THIS IS JUST TERRIBLE, SHAMEFUL I AM BUT WILL REFACTOR ONCE I FIND A WAY
        let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        
        let label = UILabel()
        label.text = "4.5"
        label.textColor = lightGray
        label.font = UIFont.systemFont(ofSize: 18)
        
        return label
    }()

    var ratingCountLabel : UILabel = {
        //THIS IS JUST TERRIBLE, SHAMEFUL I AM BUT WILL REFACTOR ONCE I FIND A WAY
        let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        
        let label = UILabel()
        label.text = "201 Ratings"
        label.textColor = lightGray
        label.font = UIFont.systemFont(ofSize: 10)
        
        return label
    }()
    
    var ageTV : UITextView = {
        let label = UITextView()
        label.isEditable = false
        label.isScrollEnabled = false
        
        let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        var attributedString = NSMutableAttributedString()
        
        
        attributedString = NSMutableAttributedString(string: "\(98)\n".capitalized, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18), NSForegroundColorAttributeName: lightGray])
        
        let range = NSMakeRange(0, attributedString.string.characters.count)
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
        
        attributedString.append(NSAttributedString(string: "Age Rating", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 10), NSForegroundColorAttributeName: lightGray]))
        
        label.attributedText = attributedString
        
        return label
    }()
    
    var versionTV : UITextView = {
        let label = UITextView()
        label.isEditable = false
        label.isScrollEnabled = false
        
        let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        var attributedString = NSMutableAttributedString()
        
        
        attributedString = NSMutableAttributedString(string: "\(2.3)\n".capitalized, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18), NSForegroundColorAttributeName: lightGray])
        
        let range = NSMakeRange(0, attributedString.string.characters.count)
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
        
        attributedString.append(NSAttributedString(string: "Version", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 10), NSForegroundColorAttributeName: lightGray]))

        
        label.attributedText = attributedString
        
        return label
    }()
    
    var inAppText : UILabel = {
        let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = lightGray
        label.numberOfLines = 0
        label.text =  "Offers In-App \nPurchases"
        return label
    }()
    
    var getBtn : UIButton = {
        let headerBlue = UIColor(red: 136/255, green: 190/255, blue: 249/255, alpha: 1)
        
        let backGroundImage = UIImage(color: headerBlue, size: CGSize(width: 30, height: 10))
        
        let btn = UIButton()
        let attributedString = NSMutableAttributedString(string: "".uppercased(), attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.white])
        btn.setAttributedTitle(attributedString, for: .normal)
        btn.setBackgroundImage(backGroundImage, for: .normal)
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btn.setTitle("GET".uppercased(), for: .normal)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    
    var appDetails : UITextView = {
        let label = UITextView()
        label.isEditable = false
        label.isScrollEnabled = false
        return label
    }()
    
    
    var appIcon : UIImageView = {
        let appICo = UIImageView()
        appICo.contentMode = .scaleToFill
        appICo.layer.cornerRadius = 12
        appICo.image = #imageLiteral(resourceName: "geometrics")
        appICo.clipsToBounds = true
        return appICo
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if let navBar = self.navigationController?.navigationBar{
            navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            navBar.shadowImage = UIImage()
            navBar.isTranslucent = false
            navBar.backgroundColor = .white
            
        }
        
        // Do any additional setup after loading the view.

        setupHeaderView()
        
        
        
    }
    
    func setupHeaderView() {
        view.addSubview(headerBG)
    
        headerBG.addSubview(appIcon)
        headerBG.addSubview(appDetails)
        headerBG.addSubview(getBtn)
        headerBG.addSubview(inAppText)
        headerBG.addSubview(ratingValue)
        headerBG.addSubview(ratingBar)
        headerBG.addSubview(ratingCountLabel)
        headerBG.addSubview(ageTV)
        headerBG.addSubview(versionTV)
        
        appIcon.anchor(headerBG.topAnchor, left: headerBG.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 16, bottomConstant: 16, rightConstant: 8, widthConstant: 90, heightConstant: 90)
        
        appDetails.anchor(appIcon.topAnchor, left: appIcon.rightAnchor, bottom: nil, right: headerBG.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightConstant: 8, widthConstant: 0, heightConstant: 50)
        
        getBtn.anchor(appDetails.bottomAnchor, left: appDetails.leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 0, bottomConstant: 8, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        inAppText.anchor(getBtn.topAnchor, left: getBtn.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
        
        headerBG.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 250)
        
        ratingValue.anchor(appIcon.bottomAnchor, left: appIcon.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 0, bottomConstant: 16, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        ratingBar.anchor(ratingValue.topAnchor, left: ratingValue.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 16, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        ratingCountLabel.anchor(ratingValue.bottomAnchor, left: ratingValue.leftAnchor, bottom: nil, right: nil, topConstant: 4, leftConstant: 0, bottomConstant: 16, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        ageTV.anchor(ratingValue.topAnchor, left: ratingBar.rightAnchor, bottom: nil, right: nil, topConstant: -8, leftConstant: 16, bottomConstant: 16, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        versionTV.anchor(ageTV.topAnchor, left: nil, bottom: nil, right: headerBG.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 16, rightConstant: 16, widthConstant: 0, heightConstant: 0)
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}