;; install package
(require-package 'ibuffer-vc)

;; load ibuffer and ibuffer-vc
(require 'ibuffer)
(require 'ibuffer-vc)

;; group ibuffer by repository root
(add-hook 'ibuffer-hook
          (lambda () (ibuffer-vc-set-filter-groups-by-vc-root)))

;; use ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

;; disable confirmation for killing unmodified buffers
(setq ibuffer-expert t)

(provide 'init-ibuffer)
