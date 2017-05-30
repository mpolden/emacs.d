(use-package flyspell
  ;; package is bundled with emacs
  :ensure nil

  :bind (:map flyspell-mode-map
              ("C-c c" . flyspell-correct-word-before-point)))

(provide 'init-flyspell)
