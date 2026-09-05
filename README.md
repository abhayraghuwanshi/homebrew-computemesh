# homebrew-computemesh

Homebrew tap for [ComputeMesh Worker](https://computemesh.pages.dev), the
desktop app that lets a machine contribute idle compute to ComputeMesh
video-transcoding jobs.

```
brew tap abhayraghuwanshi/computemesh
brew install --cask computemesh
```

This repo holds only the cask definition (`Casks/computemesh.rb`) — no
application source. The cask's `version`/`sha256` are updated
automatically by the main project's release CI on every tagged release.
