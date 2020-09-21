(use-package restclient
  :ensure t
  :init
  ;; limit number of times vars are substituted
  (setq restclient-vars-max-passes 2)
  ;; use matching client certificates from ~/.authinfo
  (setq network-stream-use-client-certificates t))

(provide 'init-restclient)
