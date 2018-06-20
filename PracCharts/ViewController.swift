//
//  ViewController.swift
//  PracCharts
//
//  Created by A-Chang Lin on 2018/6/20.
//  Copyright © 2018年 Sheng-Zhang Lin. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    var timer: Timer?
    var dataEntries = [ChartDataEntry]()
    @IBOutlet weak var scatterChartView: ScatterChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        setChart()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { _ in self.drawChart() })
        //drawChart()
        
    }
    
    
    
    func setChart() {
        scatterChartView.scaleXEnabled = false
        scatterChartView.scaleYEnabled = false
        scatterChartView.rightAxis.enabled = false
        
        scatterChartView.xAxis.setLabelCount(17, force: true)
        scatterChartView.leftAxis.setLabelCount(17, force: true)
        
        scatterChartView.xAxis.gridColor = .black
        scatterChartView.leftAxis.gridColor = .black
        
        
    }
    
    func drawChart() {
        NSLog("Draw chart!, dataEntries.count: \(dataEntries.count)")
        //var dataEntries = [ChartDataEntry]()
        for i in -256...256 {
            let dataEntry = ChartDataEntry.init(x: Double(i*Int(arc4random())%256), y: Double(i*Int(arc4random())%256))
            
            dataEntries.append(dataEntry)
        }
        
        let dataSet = ScatterChartDataSet(values: dataEntries, label: "Sample:")
        dataSet.scatterShapeSize = 2
        dataSet.setScatterShape(.circle)
        dataSet.setColor(.red)
        
        let data = ScatterChartData(dataSet: dataSet)
        
        scatterChartView.data = data
        scatterChartView.notifyDataSetChanged()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

