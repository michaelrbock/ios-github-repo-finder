//
//  SettingsViewController.swift
//  GithubDemo
//
//  Created by Michael Bock on 2/11/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

    @IBOutlet weak var starSlider: UISlider!
    @IBOutlet weak var starCountLabel: UILabel!

    var repoResultsViewController: RepoResultsViewController?
    var searchSettings: GithubRepoSearchSettings?

    override func viewDidLoad() {
        super.viewDidLoad()

        starSlider.value = Float((searchSettings?.minStars)!)
        starCountLabel.text = "\(Int(starSlider.value))"
    }

    @IBAction func sliderValueChanged(sender: UISlider) {
        starCountLabel.text = "\(Int(starSlider.value))"
    }

    @IBAction func tapCancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func tapSave(sender: UIBarButtonItem) {
        searchSettings?.minStars = Int(starSlider.value)
        repoResultsViewController?.searchSettings = searchSettings!
        repoResultsViewController?.needToUpdate = true

        dismissViewControllerAnimated(true, completion: nil)
    }
}
