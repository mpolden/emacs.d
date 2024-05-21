;;; init-flyspell.el --- configure flyspell  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package flyspell
  ;; load flyspell automatically for these modes
  :hook ((git-commit-mode . flyspell-mode)
         (gfm-mode . flyspell-mode)
         (org-mode . flyspell-mode)
         (latex-mode . flyspell-mode)))

(use-package flyspell-correct
  :ensure t
  :after flyspell
  :bind (:map flyspell-mode-map
              ("C-c s" . flyspell-correct-wrapper)))

(provide 'init-flyspell)

;;; init-flyspell.el ends here
