import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var morePetsStepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }

    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let school = schoolNameTextField.text ?? ""
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex) ?? "unknown"
        let petCount = numberOfPetsLabel.text ?? "0"
        let wantsMorePets = morePetsSwitch.isOn ? "true" : "false"

        if firstName.isEmpty || lastName.isEmpty || school.isEmpty {
            let warning = UIAlertController(title: "Missing Info", message: "Fill in your first name, last name, and school before continuing.", preferredStyle: .alert)
            warning.addAction(UIAlertAction(title: "Got it", style: .default, handler: nil))
            present(warning, animated: true, completion: nil)
            return
        }

        let introduction = "My name is \(firstName) \(lastName) and I go to \(school). I am currently in my \(year) year and I own \(petCount) dogs. It is \(wantsMorePets) that I want more pets."

        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
