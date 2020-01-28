(use-package swiper
  :bind (("C-s" . swiper)
         ;; C-r selects previous candidate, like isearch
         :map swiper-isearch-map
         ("C-r" . ivy-previous-line-or-history)))

(provide 'init-swiper)
