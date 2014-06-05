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

;; bind return to newline-and-indent
(global-set-key (kbd "RET") 'newline-and-indent)

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

(provide 'init-editing)
