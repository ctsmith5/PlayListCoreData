//
//  SongTableViewController.swift
//  PlaylistCoreData
//
//  Created by Colin Smith on 3/12/19.
//  Copyright © 2019 Colin Smith. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {

    
    
    //Landing Pad
    
    var playlist: Playlist?
    
    //Outlets
    @IBOutlet weak var artistNameTextField: UITextField!
    @IBOutlet weak var songNameTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addSongButtonTapped(_ sender: UIBarButtonItem) {
        
        guard let songTitle = songNameTextField.text,
        let songArtist = artistNameTextField.text,
        let playlist = playlist else {return}
        
        SongController.createSongWith(title: songTitle, artitst: songArtist, playlist: playlist)
        
  
        
        songNameTextField.text = ""
        artistNameTextField.text = ""
        
        tableView.reloadData()
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            guard let playlist = playlist else { return }
            guard let song = playlist.songs?[indexPath.row] as? Song else { return }
            SongController.delete(song: song)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    
    
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playlist?.songs?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)

        guard let  playlist = playlist else { return UITableViewCell()}
        if let song = playlist.songs?[indexPath.row] as? Song {
            cell.textLabel?.text = song.title
            cell.detailTextLabel?.text = song.artist
        }
        return cell
    }

}
