(use-package js
  :ensure nil ;; package is bundled with emacs

  :init
  ;; set indent level to 2
  (setq-default js-indent-level 2)

  :mode
  ;; use js-mode for json and jshint
  ("\\.\\(json\\|jshintrc\\)\\'" . js-mode)

  :bind (:map js-mode-map
              ;; C-c p runs formats json with jq
              ("C-c p" . json-pretty-print-buffer)))

(provide 'init-javascript)
