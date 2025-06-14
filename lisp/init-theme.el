;;; init-theme.el --- configure theme  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defvar mpolden/theme-light 'ef-day
  "The light theme to use when toggling themes with `mpolden/toggle-theme'.")

(defvar mpolden/theme-dark 'ef-night
  "The dark theme to use when toggling themes with `mpolden/toggle-theme'.")

(defun mpolden/switch-theme (&optional theme)
  "Disable any currently enabled themes and load THEME."
  (interactive)
  (if (and (not theme) (functionp 'consult-theme))
      (call-interactively 'consult-theme)
    (let ((custom-safe-themes t))
      (mapcar #'disable-theme custom-enabled-themes)
      (if theme
          (load-theme theme)
        (call-interactively 'load-theme)))))

(defun mpolden/current-theme ()
  "Return current theme, which is either 'light or 'dark."
  (cond
   ((memq mpolden/theme-light custom-enabled-themes) 'light)
   ((memq mpolden/theme-dark custom-enabled-themes) 'dark)
   (t (error "Failed to detect current theme. Enabled themes: %s"
             custom-enabled-themes))))

(defun mpolden/toggle-theme (&optional appearance)
  "Toggle between dark and light themes.

The variables `mpolden/theme-light' and `mpolden/theme-dark'
decides the themes to toggle between.

A prefix argument prompts for a theme to load instead of toggling
the current theme.

If APPEARANCE is either 'light or 'dark, change to the matching
theme instead of toggling."
  (interactive)
  (if current-prefix-arg
      (mpolden/switch-theme)
    (if appearance
        (pcase appearance
          ('light (mpolden/switch-theme mpolden/theme-light))
          ('dark (mpolden/switch-theme mpolden/theme-dark))
          (_ (error "Invalid apperance: %s"  appearance)))
      (let* ((is-light (eq (mpolden/current-theme) 'light))
             (new-theme (if is-light mpolden/theme-dark mpolden/theme-light)))
        (mpolden/switch-theme new-theme)))))

(use-package ef-themes
  :ensure t
  :defer nil
  :if (display-graphic-p)
  :bind ("C-c t" . mpolden/toggle-theme)
  :config
  ;; load theme
  (if (boundp 'ns-system-appearance-change-functions)
      ;; macos build which supports setting theme based on system appearance
      (add-hook 'ns-system-appearance-change-functions #'mpolden/toggle-theme)
    ;; otherwise default to dark theme
    (mpolden/toggle-theme 'dark)))

(provide 'init-theme)

;;; init-theme.el ends here
