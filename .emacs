(setq display-time-interval 1)
(setq display-time-format "%T")
(display-time)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq make-backup-files nil)
(setq visible-bell t)
(require 'skk-setup)
(setq skk-egg-like-newline t)
(setq skk-use-azik t)
(setq skk-azik-keyboard-type 'us101)
(setq evil-undo-system 'undo-redo)
(require 'evil)
(evil-mode 1)
(define-key evil-motion-state-map (kbd ";") 'evil-ex)
(define-key evil-motion-state-map (kbd ":") 'evil-repeat-find-char)
(require 'evil-numbers)
(define-key evil-normal-state-map (kbd "+") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "-") 'evil-numbers/dec-at-pt)
(when (eq system-type 'windows-nt)
  (cd (substitute-in-file-name "${USERPROFILE}/Documents"))
)
