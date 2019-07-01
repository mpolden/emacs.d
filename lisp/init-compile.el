(use-package compile
  :ensure nil ;; package is bundled with emacs

  :init
  ;; avoid reading command when compiling
  (setq compilation-read-command nil)

  :bind (("C-c m" . 'compile)))
