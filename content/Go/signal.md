---
title: "信号处理"
date: 2014-05-18 15:48
---


```
sigChan := make(chan os.Signal)
signal.Notify(sigChan, syscall.SIGUSR1, syscall.SIGTERM, syscall.SIGINT)
L:
    for {
        select {
            case sig := <-sigChan:
            switch sig {
                case syscall.SIGTERM, syscall.SIGINT:
                    log.Info("Catch SIGTERM singal, exit.")
                    break L
          }
        }
    }
```

