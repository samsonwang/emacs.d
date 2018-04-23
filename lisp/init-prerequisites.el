;; -*- coding:utf-8 -*-

;; operation system detection
(defconst *macintosh* (eq system-type 'darwin) )
(defconst *windows* (eq system-type 'windows-nt) )
(defconst *cygwin* (eq system-type 'cygwin) )
(defconst *linux* (or (eq system-type 'gnu/linux)
                      (eq system-type 'linux)) )
(defconst *unix* (or *linux* (eq system-type 'usg-unix-v)
                     (eq system-type 'berkeley-unix)) )
(defconst *emacs24* (and (not (featurep 'xemacs))
                         (>= emacs-major-version 24) ) )
(defconst *emacs25* (and (not (featurep 'xemacs))
                         (>= emacs-major-version 25) ) )

;; init config home
;; (setq config-home (file-name-directory load-file-name))
;; (message (concat "Init from: " config-home))
;; (message (concat "user-emacs-directory: " user-emacs-directory))

(defun expand-emacs-home (dir-name)
  (expand-file-name dir-name user-emacs-directory))

;; temp file litters config home, put them all int a cache directory
(defconst user-emacs-cache (expand-emacs-home ".emacs_cache/"))
(unless (file-exists-p user-emacs-cache)
  (make-directory user-emacs-cache))

;; use-package is required for 2rd priority
(add-to-list 'load-path (expand-emacs-home "site-lisp/use-package"))

;; init-prerequisites ends here
(provide 'init-prerequisites)

