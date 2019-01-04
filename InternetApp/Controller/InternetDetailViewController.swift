//
//  InternetDetailViewController.swift
//  InternetApp
//
//  Created by Perkins, Ryan on 12/14/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit
import WebKit

public class InternetDetailViewController: UIViewController
{

    @IBOutlet weak var webViewer: WKWebView!
    @IBOutlet weak var screenTitle: UILabel!
    
    var detailTitle : String?
    {
        didSet
        {
            updateView()
        }
    }
    
    var detailAddress : String?
    {
        didSet
        {
            updateView()
        }
    }
    
    private func updateView() -> Void
    {
        if(detailTitle != nil && screenTitle != nil && webViewer != nil)
        {
            if(detailTitle?.range(of: "Definitions", options: .caseInsensitive) != nil)
            {
                loadPDF()
            }
            else
            {
                if(detailAddress != nil)
                {
                    loadURL(webAddress: detailAddress!)
                }
            }
            screenTitle?.text = detailTitle
        }
    }
    
    override public func viewDidLoad() -> Void
    {
        super.viewDidLoad()

        updateView()
    }
    

    private func loadURL(webAddress: String) -> Void
    {
        let currentURL = URL(string: webAddress)
        let currentWebRequest = URLRequest(url: currentURL!)
        webViewer.load(currentWebRequest)
    }
    
    private func loadPDF() -> Void
    {
        if let contentPDF = Bundle.main.url(forResource: "internet definitions", withExtension: "pdf", subdirectory: nil, localization: nil)
        {
            let requestedPDF = NSURLRequest(url: contentPDF)
            webViewer.load(requestedPDF as URLRequest)
        }
    }
}
