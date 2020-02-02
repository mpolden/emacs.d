(use-package js
  :ensure nil ;; package is bundled with emacs

  :init
  ;; set indent level to 2
  (setq-default js-indent-level 2)

  :mode
  ;; use js-mode for json and jshint
  ("\\.\\(json\\|jshintrc\\)\\'" . js-mode)

  :bind (:map js-mode-map
              ;; C-c f formats json
              ("C-c f" . json-pretty-print-buffer)))

(provide 'init-javascript)
