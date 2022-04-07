;; -*- lexical-binding: t; -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 120 :width normal :family "Fira Code"))))
 '(bold ((t (:weight bold :height 1.0 :family "Fira Code"))))
 '(bold-italic ((t (:slant italic :weight bold :family "Victor Mono"))))
 '(italic ((t (:slant italic :weight medium :family "Victor Mono")))))


;; Configs to make Emacs "sensible"
(setq default-directory "~/"
      ;; always follow symlinks when opening files
      vc-follow-symlinks t
      ;; overwrite text when selected, like we expect.
      delete-seleciton-mode t
      ;; quiet startup
      inhibit-startup-message t
      initial-scratch-message nil
      ;; simple lock/backup file management
      backup-by-copying t
      delete-old-versions t
      ;; when quiting emacs, just kill processes
      confirm-kill-processes nil)

;; Use human-readable sizes in dired
(setq-default dired-listing-switches "-alh")

;; Refresh a buffer if changed on disk
(global-auto-revert-mode 1)

;; Always redraw immediately when scrolling (better responsiveness)
(setq fast-but-imprecise-scrolling t
      jit-lock-defer-time 0)


;; Load custom lisp modules
(add-to-list 'load-path (expand-file-name "~/.config/emacs/lisp"))
(require 'packages-init)


;; Enable paredit, rainbow-delimiters and show-paren-mode for Emacs lisp mode
;; and lisp-interaction-mode
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (paredit-mode t)
            (rainbow-delimiters-mode t)
            (show-paren-mode 1)))

(add-hook 'lisp-interaction-mode
          (lambda ()
            (paredit-mode t)
            (rainbow-delimiters-mode t)
            (show-paren-mode 1)))


(provide 'init)

;; end init.el
