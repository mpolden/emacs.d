(use-package avy
  :bind
  ;; C-x j jumps to char using 2 chars
  (("C-x j". avy-goto-char-2)
   ;; M-g M-g uses avy-goto-line instead regular goto-line
   ("M-g M-g" . avy-goto-line)))

(provide 'init-avy)
