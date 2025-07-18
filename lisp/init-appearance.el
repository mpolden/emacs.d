;;; init-appearance.el --- configure appearance  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/set-font (setting value)
  "Change font SETTING to VALUE.

SETTING must be the symbol `mpolden/font-family' or `mpolden/font-size'.
VALUE must be a valid font family, or the font size in points."
  (when (display-graphic-p)
    (cond
     ((eq setting 'mpolden/font-family)
      (when (member value (font-family-list))
        (set-face-attribute 'default nil :family value)))
     ((eq setting 'mpolden/font-size)
      (set-face-attribute 'default nil :height (* 10 value)))
     (t (error "Unknown setting: %s" setting)))))

(defcustom mpolden/font-family "Aporetic Sans Mono"
  "Set the default font."
  :type 'string
  :set 'mpolden/set-font)

(defcustom mpolden/font-size 15
  "Set the default font size in points."
  :type 'integer
  :set 'mpolden/set-font)

;; maximize frame on startup
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; disable splash
(setopt inhibit-startup-screen t)

;; hide menubar when not on os x
(when (and (fboundp 'menu-bar-mode) (not (eq system-type 'darwin)))
  (setopt menu-bar-mode nil))

;; hide toolbar
(when (fboundp 'tool-bar-mode)
  (setopt tool-bar-mode nil))

;; hide scrollbar
(when (fboundp 'scroll-bar-mode)
  (setopt scroll-bar-mode nil))

;; avoid potential gaps when frame is maximized
(setopt frame-resize-pixelwise t)

;; disable dialogs
(setopt use-dialog-box nil)

;; highlight current line
(use-package hl-line
  :hook ((compilation-mode . hl-line-mode)
         (dired-mode . hl-line-mode)
         (ibuffer-mode . hl-line-mode)
         (prog-mode . hl-line-mode)
         (text-mode . hl-line-mode)))

;; highlight matching parentheses
(use-package paren
  :hook ((text-mode . show-paren-mode)))

(defun mpolden/prog-mode-buffer-local-variables ()
  "Set buffer-local variables for `prog-mode'."
  ;; highlight trailing whitespace
  (setq-local show-trailing-whitespace t)
  ;; disable word wrapping
  (setq-local truncate-lines t))

(use-package prog-mode
  :hook ((prog-mode . mpolden/prog-mode-buffer-local-variables)))

;; render colors in compilation buffer
(use-package ansi-color
  :hook ((compilation-filter . ansi-color-compilation-filter)))

;; display line and column numbers in mode-line
(setopt line-number-mode t
        column-number-mode t)

;; display time in mode-line
(use-package time
  :init
  ;; civilized societies use a 24 hour clock
  (setopt display-time-24hr-format t)
  ;; make sunrise-sunset use a 24 hour clock
  (setopt calendar-time-display-form
          '(24-hours ":" minutes
                     (if time-zone " (") time-zone (if time-zone ")")))
  ;; hide load average
  (setopt display-time-default-load-average nil)
  ;; enable mode
  (setopt display-time-mode t))

;; do not underline compilation messages
(setopt compilation-message-face 'default)

(provide 'init-appearance)

;;; init-appearance.el ends here
