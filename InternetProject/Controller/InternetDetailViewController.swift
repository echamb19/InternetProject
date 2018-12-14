//
//  InternetDetailViewController.swift
//  InternetProject
//
//  Created by Chambers, Eden on 12/14/18.
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
    
    var detailAddress: String?
    {
        didSet
        {
            updateView()
        }
    }

    private func updateView() -> Void
    {
        if (detailTitle?.range(of: "Defintions", options: .caseInsensitive) != nil)
        {
            loadPDF()
        }
        else
        {
            if (detailAddress != nil)
            {
                loadURL(webAddress: detailAddress!)
            }
        }
        screenTitle?.text = detailTitle
    }
    
    public override func viewDidLoad()
    {
        super.viewDidLoad()

        updateView()
        // Do any additional setup after loading the view.
    }
    
    public func loadURL(webAddress: String) -> Void
    {
        let currentURL = URL(string: webAddress)
        let currentWebRequest = URLRequest(url: currentURL!)
        webViewer.load(currentWebRequest)
    }
    
    public func loadPDF() -> Void
    {
        if let contentPDF = Bundle.main.url(forResource: "PDF File Name", withExtension: "pdf", subdirectory: nil, localization: nil)
        {
            let requestedPDF = NSURLRequest(url: contentPDF)
            webViewer.load(requestedPDF as URLRequest)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
