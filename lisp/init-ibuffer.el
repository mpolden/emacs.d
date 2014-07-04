;; install package
(require-package 'ibuffer-vc)

;; load ibuffer and ibuffer-vc
(require 'ibuffer)
(require 'ibuffer-vc)

;; keep buffer list up to date and group ibuffer by repository root
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-auto-mode 1)
            (ibuffer-vc-set-filter-groups-by-vc-root)
            ;; make C-o and o behave as in dired
            (define-key ibuffer-mode-map (kbd "o")
              'ibuffer-visit-buffer-other-window)
            (define-key ibuffer-mode-map (kbd "C-o")
              'ibuffer-visit-buffer-other-window-noselect)))

;; use ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

;; disable confirmation for killing unmodified buffers
(setq ibuffer-expert t)

;; sort buffers by name
(setq-default ibuffer-default-sorting-mode 'alphabetic)

;; hide empty filter groups
(setq ibuffer-show-empty-filter-groups nil)

(provide 'init-ibuffer)
