//
//  ViewController.swift
//  zodiac year
//
//  Created by Bernice TSAI on 2020/8/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yearName: UILabel! //hidden by clearColor
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var zodaic: UILabel!
    @IBOutlet weak var timePointSlider: UISlider!
    let dateFormatter = DateFormatter()
    var dateString:String = ""
    var timer:Timer?
    var emojinum = 0
    var slidernum = 0
    let earth = ["丑","寅","卯","辰","巳","午","未","申","酉","戌","亥","子"]
    let emoji =  [" 🐮\n 丑 "," 🐯\n 寅"," 🐇\n 卯"," 🐲\n 辰"," 🐍\n 巳"," 🐎\n 午"," 🐐\n 未"," 🐒\n 申"," 🐓\n 酉"," 🐶\n 戌"," 🐷\n 亥"," 🐭\n 子"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        time()
        datepicker.locale=Locale(identifier: "zh_TW")
        dateFormatter.dateFormat = "yyyy/MM/dd"
    }
    //比對陣列內的照片,num預設0
        func compare(){
    //如果到最後一張照片時則從第一張開始,不是的話繼續跑照片num+=1
            if emojinum>=emoji.count{
                emojinum=0
                choosePicture(num2: emojinum)
                zodaic.text = emoji[emojinum]
                yearName.text = earth[emojinum]
            }else{
                choosePicture(num2: emojinum)
                zodaic.text = emoji[emojinum]
                yearName.text = earth[emojinum]
            }
    //連動Slider
            timePointSlider.value = Float(emojinum)
            emojinum+=1
}
    func time(){
        timer=Timer.scheduledTimer(withTimeInterval: 1, repeats: true){(timer) in self.compare()}
    }
    @IBAction func changeValueSlider(_ sender: UISlider) {
        sender.value.round()
        slidernum=Int(sender.value)
        zodaic.text = emoji[slidernum]
        yearName.text = earth[slidernum]
        print(slidernum)
        choosePicture(num2: slidernum)
        
    }
    
    @IBAction func changeValueDatepicker(_ sender: UIDatePicker) {
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: datepicker.date)
        let year = dateComponents.year!
        timePointSlider.value = Float(year - 2009)
        zodaic.text = emoji[Int(year-2009)]
        yearName.text = earth[Int(year-2009)]
    }
    
    @IBAction func autoPlaySwitch(_ sender: UISwitch) {
        if sender.isOn {
            time()
            emojinum = slidernum
            timePointSlider.value = Float(emojinum)
        }else{
            timer?.invalidate()
        }
    }
//用switch-case選照片
    func choosePicture(num2:Int) {
        switch num2 {
        case 0:
            dateString = "2009/12/31"
        case 1:
            dateString = "2010/12/31"
        case 2:
            dateString = "2011/12/31"
        case 3:
            dateString = "2012/12/31"
        case 4:
            dateString = "2013/12/31"
        case 5:
            dateString = "2014/12/31"
        case 6:
            dateString = "2015/12/31"
        case 7:
            dateString = "2016/12/31"
        case 8:
            dateString = "2017/12/31"
        case 9:
            dateString = "2018/12/31"
        case 10:
            dateString = "2019/12/31"
        case 11:
            dateString = "2020/12/31"
        
        default:
            dateString = "2020/08/26"
        }
        let date = dateFormatter.date(from: dateString)
        datepicker.date=date!
    }
    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
}
