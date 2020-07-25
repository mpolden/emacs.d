(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
         ;; C-r selects previous candidate, like isearch
         :map swiper-isearch-map
         ("C-r" . ivy-previous-line-or-history)))

(provide 'init-swiper)
