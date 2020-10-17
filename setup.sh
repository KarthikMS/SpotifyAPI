run() {
    pod install
    if [ $? != 0 ]; then echo "Pod installation failed."; return 1; fi
    open SpotifyAPI.xcworkspace
}

run

