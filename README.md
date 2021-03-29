Neovim用の設定ファイル類。

XDG_CONFIG_HOME/nvimにこのリポジトリの内容をcloneすれば使える。

## 前提
- gitコマンドが使えて、リモートリポジトリのcloneが出来ること
- Windowsの場合pyコマンド、Linuxの場合pythonコマンドで正しくpythonが起動できること
- py(thon) -m pip install neovimしてあること
- XDG_CONFIG_HOME環境変数が設定済みであること

## python環境について
https://dskk.hatenablog.com/entry/2021/03/30/000656

## XDG_CONFIG_HOMEについて
Windowsはユーザー環境変数の設定画面から
```
変数名=XDG_CONFIG_HOME
変数値=C:\Users\Masa\Documents
```
などすれば良い。

Linuxは.bashrcに以下を追記。
```
export XDG_CONFIG_HOME=$HOME/.config
```