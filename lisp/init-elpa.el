;; -*- coding:utf-8 -*-
;; MELPA configurations are contained
;; Mostly the package basic configurations
;;

;;=============================================================================
;;  Package settings
;;=============================================================================

(when *emacs24*
  
  ;; melpa packages
  (add-to-list 'package-archives
    '("melpa-stable" . "https://stable.melpa.org/packages/"))
  (add-to-list 'package-archives
    '("melpa-cn-stable" . "http://elpa.emacs-china.org/melpa-stable/"))

;;  (add-to-list 'package-archives
;;    '("popkit" . "http://elpa.popkit.org/packages/"))
;;  (add-to-list 'package-archives
;;    '("melpa-cn"        . "http://elpa.emacs-china.org/melpa/"))

  
  (require 'elpa-auto-install.el)
  ;; package to install
  (defvar my-packages
    '(company yasnippet markdown-mode helm))
  
  ;; auto install package above
  (auto-install-packages my-packages)

  ;; package configurations
  
  ;; Enable smex
  ;; (smex-initialize)

  ;; Enable Global Company Mode
  (global-company-mode t)

  ;; Enable yasnippet
  (require 'yasnippet)
  (setq yas-verbosity 0)
  (yas-global-mode 1)
  (setq yas-snippet-dirs (concat config-home "snippets"))

  ;; 
;;  (require 'init-ivy)

  (require 'init-helm)

  
  ;;(require 'init-global)
  ;;(require 'init-tramp)
  ;;(require 'init-modeline)

  )

;; Enable autocomplete mode
;;(auto-complete-mode t)
;;(ac-config-default)	;; auto-complete basic configuration

(provide 'init-elpa)
;;; init-customization.el ends here

