;; start server for emacsclient
(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'init-server)
