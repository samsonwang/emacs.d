
;; -*- coding:utf-8 -*-

(setq autosave-dir (concat config-home ".emacs_autosaves/") )
(setq backup-dir (concat config-home ".emacs_backups/") )

; create the autosave dir if necessary, since emacs won't.
(unless (file-exists-p autosave-dir)
  (make-directory autosave-dir) )

(unless (file-exists-p backup-dir)
  (make-directory backup-dir) )

(setq backup-by-copying t ; don't clobber symlinks
      version-control t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2) ; use versioned backups

;; don't litter my fs tree
(setq backup-directory-alist
      `( ( "." . ,backup-dir ) ) )

;; backup version controlled files
(setq vc-make-backup-files t)

;; turn on autosave
(setq auto-save-default t
      auto-save-timeout 20
      auto-save-interval 200)

(setq auto-save-file-name-transforms
      `( (".*" ,autosave-dir t) ) )

(setq auto-save-list-file-prefix autosave-dir)

;;; init-backup-func.el ends here
(provide 'init-backup)

