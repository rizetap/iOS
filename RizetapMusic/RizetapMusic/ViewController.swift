//
//  ViewController.swift
//  RizetapMusic
//
//  Created by Perizat Muratova on 29.11.2025.
//

import UIKit
import AVFoundation

final class ViewController: UIViewController {
    
    
    // MARK: - IBOutlets
    @IBOutlet private weak var trackTitleLabel: UILabel!
    @IBOutlet private weak var artistLabel: UILabel!
    @IBOutlet private weak var coverImageView: UIImageView!
    
    @IBOutlet private weak var previousButton: UIButton!
    @IBOutlet private weak var playPauseButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    
    // MARK: - Playback
    private var audioPlayer: AVAudioPlayer?
    private var playlist: PlaylistManager!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadTracks()
        loadCurrentTrackAndPrepare()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        trackTitleLabel.text = ""
        artistLabel.text = ""
        coverImageView.layer.cornerRadius = 12
        coverImageView.clipsToBounds = true
        updatePlayPauseButton(isPlaying: false)
    }
    
    private func loadTracks() {
        let tracks = [
            Track(title: "Балуюсь", artist: "Ирина Кайратовна", coverImageName: "cover1", audioFileName: "track1", audioFileExtension: "mp3"),
            Track(title: "Рэймен", artist: "Face", coverImageName: "cover2", audioFileName: "track2", audioFileExtension: "mp3"),
            Track(title: "Пей", artist: "Face", coverImageName: "cover3", audioFileName: "track3", audioFileExtension: "mp3"),
            Track(title: "Меняться телами", artist: "Свидание", coverImageName: "cover4", audioFileName: "track4", audioFileExtension: "mp3"),
            Track(title: "Твоим именем", artist: "Свидание", coverImageName: "cover5", audioFileName: "track5", audioFileExtension: "mp3")
        ]
        playlist = PlaylistManager(tracks: tracks)
    }
    
    private func loadCurrentTrackAndPrepare(playImmediately: Bool = false) {
        guard let track = playlist.currentTrack else {
            print("No track at index \(playlist.currentIndex)")
            return
        }
        trackTitleLabel.text = track.title
        artistLabel.text = track.artist
        coverImageView.image = track.coverImage
        
        stopAndUnloadPlayer()
        preparePlayer(for: track)
        
        if playImmediately {
            play()
        } else {
            updatePlayPauseButton(isPlaying: false)
        }
    }
    
    private func preparePlayer(for track: Track) {
        guard let url = Bundle.main.url(forResource: track.audioFileName, withExtension: track.audioFileExtension) else {
            print("Audio file not found: \(track.audioFileName).\(track.audioFileExtension)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
        } catch {
            print("Failed to create AVAudioPlayer:", error)
        }
    }
    
    private func stopAndUnloadPlayer() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
    
    // MARK: - Playback controls
    private func play() {
        guard let player = audioPlayer else {
            loadCurrentTrackAndPrepare(playImmediately: true)
            return
        }
        if !player.isPlaying {
            player.play()
            updatePlayPauseButton(isPlaying: true)
        }
    }
    
    private func pause() {
        guard let player = audioPlayer, player.isPlaying else { return }
        player.pause()
        updatePlayPauseButton(isPlaying: false)
    }
    
    private func togglePlayPause() {
        if audioPlayer?.isPlaying == true {
            pause()
        } else {
            play()
        }
    }
    
    // MARK: - IBActions
    @IBAction private func previousTapped(_ sender: UIButton) {
        guard playlist.previousTrack() else { return }
        loadCurrentTrackAndPrepare(playImmediately: true)
    }
    
    @IBAction private func playPauseTapped(_ sender: UIButton) {
        togglePlayPause()
    }
    
    @IBAction private func nextTapped(_ sender: UIButton) {
        guard playlist.nextTrack() else { return }
        loadCurrentTrackAndPrepare(playImmediately: true)
    }
    
    // MARK: - UI updates
    private func updatePlayPauseButton(isPlaying: Bool) {
        let config = UIImage.SymbolConfiguration(pointSize: 28, weight: .regular)
        let imageName = isPlaying ? "pause.fill" : "play.fill"
        let image = UIImage(systemName: imageName, withConfiguration: config)
        playPauseButton.setImage(image, for: .normal)
        playPauseButton.accessibilityLabel = isPlaying ? "Pause" : "Play"
    }
}

// MARK: - AVAudioPlayerDelegate
extension ViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if playlist.repeatMode == .one {
            player.currentTime = 0
            player.play()
            return
        }
        let wasLast = playlist.currentIndex == (playlist.tracks.count - 1)
        playlist.nextTrack()
        if playlist.currentIndex == 0 && wasLast && playlist.repeatMode == .off {
            updatePlayPauseButton(isPlaying: false)
        } else {
            loadCurrentTrackAndPrepare(playImmediately: true)
        }
    }
    
}




