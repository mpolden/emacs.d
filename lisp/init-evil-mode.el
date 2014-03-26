;; install packages
(require-package 'evil)
(require-package 'key-chord)

;; load evil mode
(require 'evil)
(evil-mode 1)

;; load key-chord and map jj to normal mode
(require 'key-chord)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;; initial state for ibuffer-mode should be normal
(evil-set-initial-state 'ibuffer-mode 'normal)

(provide 'init-evil-mode)
