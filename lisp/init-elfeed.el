;;; init-elfeed.el --- configure rss reader  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package elfeed
  :ensure t
  :init
  ;; set default filter
  (setq elfeed-search-filter "@2-days-ago +unread")
  :bind (:map elfeed-search-mode-map
              ;; o opens entry
              ("o" . elfeed-search-show-entry)))

(provide 'init-elfeed)

;;; init-elfeed.el ends here
