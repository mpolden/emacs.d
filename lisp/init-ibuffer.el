(use-package ibuffer
  :init
  ;; disable confirmation for killing unmodified buffers
  (setq ibuffer-expert t)

  ;; sort buffers by name
  (setq-default ibuffer-default-sorting-mode 'alphabetic)

  ;; hide empty filter groups
  (setq ibuffer-show-empty-filter-groups nil)

  ;; use ibuffer
  :bind (("C-x C-b" . ibuffer-other-window)
         :map ibuffer-mode-map
         ;; make C-o and o behave as in dired
         ("o" . ibuffer-visit-buffer-other-window)
         ("C-o" . ibuffer-visit-buffer-other-window-noselect)))

(use-package ibuffer-vc
  :ensure t
  :after ibuffer

  :init
  ;; enable for remote files
  (setq ibuffer-vc-skip-if-remote nil)

  ;; group ibuffer by repository root
  :hook (ibuffer-mode . ibuffer-vc-set-filter-groups-by-vc-root)

  :bind (:map ibuffer-mode-map
         ;; g updates both buffers and repository groups
         ("g" . ibuffer-vc-set-filter-groups-by-vc-root)))

(provide 'init-ibuffer)
