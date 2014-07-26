(require 'imenu)

;; make imenu automatically rescan buffers
(setq imenu-auto-rescan t)

;; C-c i shows imenu
;; imenu will use ido completion if ido-ubiquitous-mode is enabled
(global-set-key (kbd "C-c i") 'imenu)

(provide 'init-imenu)
