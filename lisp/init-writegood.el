;;; init-writegood.el --- configure weasel word detection
;;; Commentary:
;;; Code:

(use-package writegood-mode
  :ensure t
  :hook
  ;; load writegood-mode automatically when flyspell is used
  (flyspell-mode . writegood-mode))

(provide 'init-writegood)

;;; init-writegood.el ends here
