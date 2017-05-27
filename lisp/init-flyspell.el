(use-package flyspell
  ;; package is bundled with emacs
  :ensure nil

  :bind ("C-c c" . flyspell-correct-word-before-point))

(provide 'init-flyspell)
