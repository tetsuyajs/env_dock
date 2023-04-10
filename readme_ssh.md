# Dockerコンテナ内へSSH接続する場合

## SSHサーバーコンテナをリビルドする場合の注意

- SSHクライアントはSSHでサーバーに接続する際、サーバーのSSHキーを記録している。

- 以前接続したことがあるホストへサイド接続する際、過去のSSHキーと違う場合エラー(下記)が発生し、接続できない。
```
$ ssh user@172.17.0.2
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ED25519 key sent by the remote host is
SHA256:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.
Please contact your system administrator.
Add correct host key in /home/xxx/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in /home/xxx/.ssh/known_hosts:11
  remove with:
  ssh-keygen -f "/home/xxx/.ssh/known_hosts" -R "172.17.0.2"
Host key for 172.17.0.2 has changed and you have requested strict checking.
Host key verification failed.
```

- DockerコンテナでSSH接続する際、コンテナをリビルドするケースは多く、このことで接続不能になることは多くなる。

- コンテナをリビルドしたら接続側で`ssh-keygen -R [IP addres/Host]`のコマンドでSSHキーを削除する必要がある。(172.17.0.2の場合、`ssh-keygen -R 172.17.0.2`のコマンドを実行する)

- 高頻度にリビルドされる場合は、以下のようなファイルを作成し、記述する方法もある。
```~/.ssh/config
Host 172.17.0.2
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null
```



