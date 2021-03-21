;;; init-server.el --- configure server for emacsclient  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package server
  :config
  (unless (server-running-p)
    (server-start)))

(provide 'init-server)

;;; init-server.el ends here
