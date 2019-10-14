//
//  ReviewViewController.swift
//  ios-movies-app
//  Created by Swathi on 05/10/2019.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    var review: Review?
    @IBOutlet weak var reviewerName: UILabel!
    @IBOutlet weak var reviewContent: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        if self.review != nil {
            self.reviewerName.text = review?.author
            self.reviewContent.text = review?.content
        }
        // Do any additional setup after loading the view.
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
