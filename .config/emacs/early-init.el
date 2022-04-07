;; -*- lexical-binding: t; -*-

;; Prevent package.el loading packages prior to the init-file
(setq package-enable-at-startup nil)

;; Unset file-name-handler-alist temporarily
;; (Emacs consults this variable every time a file is read or library loaded,
;; or when certain functions in the file API are used, which is not necessary
;; at startup)
(defvar custom-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(add-hook 'emacs-startup-hook
  (lambda ()
    (setq file-name-handler-alist custom-file-name-handler-alist)))


(provide 'early-init)

;; end early-init.el
