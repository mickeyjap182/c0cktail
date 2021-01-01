# go

## bin
A compiled source binary in this dir.

### direnv
install direnv for setting each environment variabls. I verified on MacOS.
- if you use login bash, add following snippets to ~/.bash_profile.
And $EDITOR is your preffered editor's path.
```
export EDITOR='/usr/bin/vim'
eval "$(direnv hook bash)"
```
- You run a following command at your working directory.
```
direnv edit .
```

- go gui
-- Pending
install Qt module.

https://github.com/therecipe/qt/blob/9720239949e766fb495002290a55a301a2e4f9e9/README.md#regular-setup

```
go get -u github.com/therecipe/qt/cmd/...
cd <your_workdir>
qtsetup install
qtsetup check
```
