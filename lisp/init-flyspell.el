(use-package flyspell
  ;; package is bundled with emacs
  :ensure nil

  :bind (:map flyspell-mode-map
              ("C-c s" . flyspell-correct-word-before-point)))

(provide 'init-flyspell)
