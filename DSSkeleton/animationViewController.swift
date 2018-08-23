

import UIKit

class animationViewController: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblQoute: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startViewAnimation()
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func startViewAnimation()  {
        imgProfile.startDSLoading()
        lblName.startDSLoading()
        lblQoute.startDSLoading()
        lblAuthor.startDSLoading()
    }
    
    @objc func stopViewAnimation() {
        imgProfile.image = #imageLiteral(resourceName: "jhonDoe.png")
        imgProfile.stopDSLoading()

        lblName.text = "Darshit Shah"
        lblName.stopDSLoading()
        
        lblQoute.text = "I've learned that you shouldn't go through life with a catcher's mitt on both hands; you need to be able to throw something back."
         lblQoute.stopDSLoading()
        
        lblAuthor.text = "- Maya Angelou"
        lblAuthor.stopDSLoading()
    }
    
    
    @IBAction func loadingClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.setTitle(sender.isSelected ? "START LOADING" : "STOP LOADING" , for: .normal)
        if sender.isSelected {
            stopViewAnimation()
        }
        else{
            startViewAnimation()
        }
        
    }
}

