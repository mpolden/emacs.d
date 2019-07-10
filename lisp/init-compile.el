(use-package compile
  :ensure nil ;; package is bundled with emacs

  :init
  ;; avoid reading command when compiling
  (setq compilation-read-command nil)

  ;; C-u C-c m will always read command
  :bind (("C-c m" . 'compile)))

(provide 'init-compile)
