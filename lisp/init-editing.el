;; install packages
(require-package 'move-text)
(require-package 'whole-line-or-region)

(require 'move-text)
(require 'whole-line-or-region)

;; cut or copy the currrent line if no region is active
(whole-line-or-region-mode t)

;; bind keys for moving lines up and down
(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

;; duplicating a line or region
(defun duplicate-region (beg end)
  "Insert a copy of the current region after the region."
  (interactive "r")
  (save-excursion
    (goto-char end)
    (insert (buffer-substring beg end))))

(defun duplicate-line-or-region (prefix)
  "Duplicate either the current line or any current region."
  (interactive "*p")
  (whole-line-or-region-call-with-region 'duplicate-region prefix t))

(global-set-key (kbd "C-c p") 'duplicate-line-or-region)

;; undo
(global-set-key (kbd "C-u") 'undo)

;; move to next and previous paragraph
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

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

;; C-. repeats last command
(global-set-key (kbd "C-.") 'repeat)

(provide 'init-editing)
