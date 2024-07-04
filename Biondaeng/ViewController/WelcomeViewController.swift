import UIKit

class WelcomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapStartButton(_ sender: UIButton) {
        guard let VC = storyboard?.instantiateViewController(identifier: "SetAlarmViewController") as? SetAlarmViewController else {
                return
        }
        
        VC.modalPresentationStyle = .pageSheet
        
        if let sheet = VC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        
        present(VC, animated: true, completion: nil)
    }
}
