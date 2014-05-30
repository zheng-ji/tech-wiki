---
title: "logger使用"
date: 2014-05-18 15:48
---

```python
def init_logger(log_filename='log.log'):
    import logging

    logger = logging.getLogger()
    formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')

    hdlr = logging.FileHandler(log_filename)
    hdlr.setFormatter(formatter)
    logger.addHandler(hdlr)
    logger.setLevel(logging.NOTSET)

    return logger

```

