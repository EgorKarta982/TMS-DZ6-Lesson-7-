import UIKit

//MARK: - enum

enum Direction: String{
    case left = "left"
    case right = "right"
}

class ViewController: UIViewController {
    //MARK: - IBOutlets
    
    @IBOutlet var outputLabel: UILabel!
    
    
    //MARK: - var/let
    
    let width: CGFloat = 50
    let heith: CGFloat = 50
    let step: CGFloat = 20
    let myView = UIView()

    //MARK: - lifecycle func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        
       
    }
    
    //MARK: - IBActions
    
    @IBAction func leftButtonPressed(_ sender: UIButton) {
        if myView.frame.origin.x - step < 0{
            outputLabel.text = "hit the boundaries"
        }
            else {
                outputLabel.text = ""
                move(direction: .left)
        }
    }

    @IBAction func rightButtonPressed(_ sender: UIButton) {
        if myView.frame.origin.x + step + width > view.frame.width{
            outputLabel.text = "hit the boundaries"
        }
            else {
                outputLabel.text = ""
                move(direction: .right)
            }
    }
    
    
    //MARK: - flow funcs
    
    private func move(direction: Direction){
        switch direction{
        case .left:
            self.myView.frame.origin.x -= step
        case .right:
            self.myView.frame.origin.x += step
        }
        print("Move to \(direction.rawValue)") // выводим значение текущего Енама на консоль
    }
    
    private func createView(){
        self.myView.frame = CGRect (x: 100, y: 100, width: self.width, height: self.heith)
        self.myView.backgroundColor = .brown
        self.view.addSubview(myView)
    }


}

