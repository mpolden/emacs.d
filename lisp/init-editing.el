 ;; cut or copy the currrent line if no region is active
(use-package whole-line-or-region
  :diminish whole-line-or-region-mode
  :config
  (whole-line-or-region-mode 1))

;; use zap-up-to-char instead of zap-to-char
(use-package misc
  :ensure nil ;; package is bundled with emacs
  :bind ("M-z" . zap-up-to-char))

;; enable subword-mode in prog-mode
(use-package subword
  :ensure nil ;; package is bundled with emacs
  :diminish subword-mode
  :config
  (add-hook 'prog-mode-hook 'subword-mode))

;; enable electric-indent-mode
(use-package electric
  :ensure nil ;; package is bundled with emacs
  :config
  (electric-indent-mode 1))

;; use sh-mode for various zsh files
(use-package sh-script
  :ensure nil ;; package is bundled with emacs
  :mode ("z\\(sh[^/]*\\|login\\|logout\\|profile\\|preztorc\\)\\'" . sh-mode))

;; find function definitions
(use-package find-func
  :ensure nil ;; package is bundled with emacs

  :bind (("C-h C-f" . find-function-other-window)
         ("C-h C-k" . find-function-on-key)))

(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message buffer-file-name))

;; source: http://rejeep.github.io/emacs/elisp/2010/03/26/rename-file-and-buffer-in-emacs.html
(defun rename-this-buffer-and-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (cond ((get-buffer new-name)
               (error "A buffer named '%s' already exists!" new-name))
              (t
               (rename-file filename new-name 1)
               (rename-buffer new-name)
               (set-visited-file-name new-name)
               (set-buffer-modified-p nil)
               (message "File '%s' successfully renamed to '%s'" name
                        (file-name-nondirectory new-name))))))))

;; disable backup files
(setq make-backup-files nil)

;; preserve point position when scrolling
(setq scroll-preserve-screen-position 'always)

;; swap RET and C-j
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-j") 'newline)

;; C-x k kills current buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; C-c f shows the path of the current file
(global-set-key (kbd "C-c f") 'show-file-name)

;; bind hippie-expand
(global-set-key (kbd "C-c e") 'hippie-expand)

;; join line
(global-set-key (kbd "M-j") (lambda () (interactive) (join-line -1)))

;; C-c n renames the current buffer and file
(global-set-key (kbd "C-c n") 'rename-this-buffer-and-file)

(provide 'init-editing)
