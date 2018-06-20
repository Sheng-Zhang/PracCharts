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
    let MAX_DATA_NUMBER = 15*256
    
    var counter = 0
    
    @IBOutlet weak var scatterChartView: ScatterChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        for _ in 0..<MAX_DATA_NUMBER {
//            dataEntries.append(ChartDataEntry(x: 0, y: 0))
//        }
        
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
        
        scatterChartView.chartDescription?.enabled = false
        
        scatterChartView.xAxis.drawLabelsEnabled = false
        scatterChartView.leftAxis.drawLabelsEnabled = false
        
        scatterChartView.xAxis.setLabelCount(17, force: true)
        scatterChartView.leftAxis.setLabelCount(17, force: true)
        
        scatterChartView.xAxis.gridColor = .black
        scatterChartView.leftAxis.gridColor = .black
        
        scatterChartView.xAxis.axisMaximum = 256
        scatterChartView.xAxis.axisMinimum = -256
        
        scatterChartView.leftAxis.axisMaximum = 256
        scatterChartView.leftAxis.axisMinimum = -256
        
    }
    
    func drawChart() {
        NSLog("Draw chart!, dataEntries.count: \(dataEntries.count)")
        //var dataEntries = [ChartDataEntry]()
        for i in -128..<128 {
            
            if MAX_DATA_NUMBER > self.dataEntries.count {
                dataEntries.append(ChartDataEntry(x: Double(i*Int(arc4random())%256), y: Double(i*Int(arc4random())%256)))
            } else {
                
                dataEntries[counter % MAX_DATA_NUMBER].x = Double(i*Int(arc4random())%256)
                dataEntries[counter % MAX_DATA_NUMBER].y = Double(i*Int(arc4random())%256)
            }
            counter += 1
        }
        
        let dataSet = ScatterChartDataSet(values: dataEntries, label: "Counter:\(counter)    entry count: \(dataEntries.count)")
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

