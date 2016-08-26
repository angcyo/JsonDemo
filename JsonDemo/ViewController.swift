//
//  ViewController.swift
//  JsonDemo
//
//  Created by angcyo on 16/08/25.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

		testStringNSString()

		let bean = JsonBean()
		print("\(isVaildJson(bean))")

//		let bean2 = [["str1": "string", "str2": 2, "str3": 2.2, "str4": ["ss1": "sss", "ss2": 2, "ss3": 2.2]]]
		let bean2 = ["str1": "string", "str2": 2, "str3": 2.2, "str4": ["ss1": "sss", "ss2": 2, "ss3": 2.2]]
		print("\(isVaildJson(bean2))")

		// NSJSONSerialization.JSONObjectWithData(bean2, options: .AllowFragments)
//		let data = try? NSJSONSerialization.dataWithJSONObject(bean2, options: .PrettyPrinted)
		let data = try? NSJSONSerialization.dataWithJSONObject(bean2, options: [])
		// {"str2":2,"str3":2.2,"str4":{"ss1":"sss","ss2":2,"ss3":2.2},"str1":"string"}
		let nsString = NSString(data: data!, encoding: NSUTF8StringEncoding)
		print("1:\(nsString!)")

		let string = String(data: data!, encoding: NSUTF8StringEncoding)
		print("2:\(string!)")

		let str = string! as NSString
		print("3:\(str)")

		let nsData = string?.dataUsingEncoding(NSUTF8StringEncoding)
//		let nsData = nsString?.dataUsingEncoding(NSUTF8StringEncoding)

		let object = try! NSJSONSerialization.JSONObjectWithData(nsData!, options: .MutableLeaves)
//		let object = try! NSJSONSerialization.JSONObjectWithData(nsData!, options: .MutableLeaves) as! NSDictionary
//		let object = try! NSJSONSerialization.JSONObjectWithData(nsData!, options: .MutableContainers) as! NSArray
		print("4:\(object)")
		print("5:\(object["str4"]!)")
		print("5:\(object["str4"]!!["ss3"])")
//        print("4:\(object)")
//        print("5:\(object.firstObject!["str4"]!)")
//        print("5:\(object.firstObject!["str4"]!!["ss3"])")
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}

extension ViewController {
	// mark: 判断对象是不是有效的Json对象.(是否能转换成Json字符串)
	func isVaildJson(obj: AnyObject) -> Bool {
		return NSJSONSerialization.isValidJSONObject(obj)
	}

	func testStringNSString() {
		let nsString = NSString(string: "This is a string")
		let string = String(nsString)

		print("\(nsString)")
		print("\(string)")
	}
}

