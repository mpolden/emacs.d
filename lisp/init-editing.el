;; install packages
(require-package 'move-text)
(require-package 'whole-line-or-region)

(require 'move-text)
(require 'whole-line-or-region)
(require 'misc)

;; cut or copy the currrent line if no region is active
(whole-line-or-region-mode t)

;; bind keys for moving lines up and down
(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

;; undo
(global-set-key (kbd "C-u") 'undo)

;; use zap-up-to-char instead of zap-to-char
(global-set-key (kbd "M-z") 'zap-up-to-char)

;; open line below or above current line
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(global-set-key (kbd "C-o") 'open-line-below)
(global-set-key (kbd "C-S-o") 'open-line-above)

;; swap RET and C-j
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-j") 'newline)

;; C-x k kills current buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; C-c r reverts buffer without confirmation
(defun revert-buffer-without-query ()
  "Revert the current buffer without confirmation."
  (interactive)
  (revert-buffer t t))

(global-set-key (kbd "C-c r") 'revert-buffer-without-query)

;; C-c . repeats last command
(global-set-key (kbd "C-c .") 'repeat)

(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message buffer-file-name))

(global-set-key (kbd "C-c f") 'show-file-name)

;; bind hippie-expand
(global-set-key (kbd "C-c e") 'hippie-expand)

;; whitespace cleanup
(defun untabify-buffer ()
  (if (eq 'go-mode major-mode)
      (message "Skipping untabify-buffer in go-mode.")
    (progn (interactive)
           (untabify (point-min) (point-max)))))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (indent-buffer))

(global-set-key (kbd "C-c w") 'cleanup-buffer)

(provide 'init-editing)
