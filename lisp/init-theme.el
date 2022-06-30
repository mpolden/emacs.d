;;; init-theme.el --- configure theme  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defvar mpolden/theme-light 'doom-one-light
  "The light theme to use when toggling themes with `mpolden/toggle-theme'.")

(defvar mpolden/theme-dark 'doom-one
  "The dark theme to use when toggling themes with `mpolden/toggle-theme'.")

(defun mpolden/switch-theme (&optional theme)
  "Disable any currently enabled themes and load THEME."
  (interactive "P")
  (mapcar #'disable-theme custom-enabled-themes)
  (let ((custom-safe-themes t))
    (if theme
        (load-theme theme)
      (call-interactively 'load-theme))))

(defun mpolden/current-theme ()
  "Return current theme, which is either \"light\" or \"dark\"."
  (cond
   ((memq mpolden/theme-light custom-enabled-themes) "light")
   ((memq mpolden/theme-dark custom-enabled-themes) "dark")
   (t (error "Failed to detect light theme. Enabled themes: %s"
             custom-enabled-themes))))

(defun mpolden/toggle-theme ()
  "Toggle between dark and light themes.
The variables `mpolden/theme-light' and `mpolden/theme-dark'
decides the themes to toggle between."
  (interactive)
  (let* ((is-light (equal (mpolden/current-theme) "light"))
         (new-theme (if is-light mpolden/theme-dark mpolden/theme-light))
         (new-vterm-theme (if is-light "dark" "light")))
    (progn
      (mpolden/switch-theme new-theme)
      (when (fboundp 'mpolden/vterm-change-theme)
        (mpolden/vterm-change-theme new-vterm-theme))
      (when (fboundp 'mpolden/vterm-set-theme)
        (mpolden/vterm-set-theme new-vterm-theme)))))

(use-package doom-themes
  :ensure t
  :defer nil
  :if (display-graphic-p)
  :bind ("C-c T" . mpolden/toggle-theme)
  :config
  (load-theme mpolden/theme-dark t))

(provide 'init-theme)

;;; init-theme.el ends here
