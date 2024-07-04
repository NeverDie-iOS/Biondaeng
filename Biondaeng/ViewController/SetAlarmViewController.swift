import UIKit

class SetAlarmViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var cancleButton: UIButton!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var alarmPickerView: UIPickerView!
    
    // 오전/오후, 시간(1~12), 분(00~59)의 데이터 배열
    let amPm = ["오전", "오후"]
    let hours = Array(1...12)
    let minutes = Array(0...59)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        // UIPickerView의 데이터 소스와 델리게이트를 설정
        alarmPickerView.dataSource = self
        alarmPickerView.delegate = self
    }
    
    func configureButton(){
        cancleButton.layer.borderWidth = 0.5
        cancleButton.layer.borderColor = UIColor.black.cgColor
        cancleButton.layer.cornerRadius = 10
        
        completeButton.layer.cornerRadius = 10
    }
    
    
    // MARK: - UIPickerViewDataSource
    
    // 열(column)의 개수 설정
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3 // 오전/오후, 시간, 분 세 개의 열이 있음
    }
    
    // 각 열(column)의 행(row) 개수 설정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: // 첫 번째 열: 오전/오후
            return amPm.count
        case 1: // 두 번째 열: 시간
            return hours.count
        case 2: // 세 번째 열: 분
            return minutes.count
        default:
            return 0
        }
    }
    
    // MARK: - UIPickerViewDelegate
    
    // 각 행(row)의 타이틀 설정
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0: // 첫 번째 열: 오전/오후
            return amPm[row]
        case 1: // 두 번째 열: 시간
            return "\(hours[row])"
        case 2: // 세 번째 열: 분
            return String(format: "%02d", minutes[row]) // 분을 두 자리로 표시
        default:
            return nil
        }
    }
    
    // 사용자가 선택한 값을 처리할 수 있습니다.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 선택된 값을 가져오는 예시 코드
        let selectedAmPm = amPm[pickerView.selectedRow(inComponent: 0)]
        let selectedHour = hours[pickerView.selectedRow(inComponent: 1)]
        let selectedMinute = minutes[pickerView.selectedRow(inComponent: 2)]
        
        // 선택된 값을 사용하여 다른 로직을 수행하거나 UI에 반영할 수 있습니다.
        print("Selected time: \(selectedAmPm) \(selectedHour):\(selectedMinute)")
    }
    
}
