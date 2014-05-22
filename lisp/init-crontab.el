;; install package
(require-package 'crontab-mode)

(require 'crontab-mode)

;; use crontab-mode for cron, crontab and .cron files
(add-to-list 'auto-mode-alist '("\\.?cron\\(tab\\)?\\'" . crontab-mode))

(provide 'init-crontab)
