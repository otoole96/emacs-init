

;;; Code:

(package-initialize)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(add-hook (quote after-init-hook) t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(blink-cursor-blinks 3)
 '(blink-cursor-interval 0.25)
 '(company-auto-complete (quote (quote company-explicit-action-p)))
 '(ctl-arrow t)
 '(cursor-type t)
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(fset (quote yes-or-no-p) t)
 '(global-hl-line-mode 1)
 '(global-linum-mode t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(insert-default-directory t)
 '(line-number-mode 1)
 '(menu-bar-mode nil)
 '(package-archives
   (quote
	(("gnu" . "http://elpa.gnu.org/packages/")
	 ("melpa" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages (quote (flycheck company org)))
 '(put (quote upcase-region) t)
 '(ring-bell-function (quote ignore))
 '(scroll-bar-mode nil)
 '(send-mail-function (quote mailclient-send-it))
 '(tool-bar-mode nil)
 '(visible-cursor nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Setup my find-files
(define-key global-map "\ey" 'find-file)
(define-key global-map "\eY" 'find-file-other-window)

;; My key-bindings

(defvar my-keys-minor-mode-map (make-keymap) "My-keys-minor-mode keymap.")

(defmacro my-keys-add (shortcut func-sym)
  "Helper macro for adding shortcuts to my-keys-minor-mode"
  `(define-key my-keys-minor-mode-map (kbd ,shortcut) ,func-sym))



(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

(my-keys-add "C-S-x"       'backward-kill-word)
(my-keys-add "C-S-c"       'kill-word)
(my-keys-add "M-."         'forward-paragraph)
(my-keys-add "M-,"         'backward-paragraph)


;; Add lines before/after cursor

(defun my/insert-line-before (times)
  "inserts new line above the cursor"
  (interactive "p")     ; Called from M-x
  (save-excursion
	(move-beginning-of-line 1)
	(newline times)))   ;inserts new line


(defun my/insert-line-after (times)
  "inserts new line above the cursor"
  (interactive "p")     ; Called from M-x
  (save-excursion
	(move-end-of-line 1)
	(newline times)))   ;inserts new line




(global-set-key (kbd "C-S-i")'my/insert-line-before)
;; (global-set-key (kbd "C-S-k")'my/insert-line-after)

(global-set-key (kbd "M-d")'backward-word)


;; Replace yes/no prompts with y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; SGML Mode for html
(add-to-list 'auto-mode-alist '("\\.html\\'" . sgml-mode))


;; Init JavaScript files with js2 IDE
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Company Mode
(add-hook 'after-init-hook 'global-company-mode)

;; Startup Windows
(split-window-horizontally)

;; Auto load files on startup
;(find-file-other-window "/documents/org/todo.org")

;;Display time
(display-time)

;;Smooth scroll
(setq scroll-step 3)

;; Some defaults
(setq-default
 tab-width 4                                     ; Set width for tabs
 window-combination-resize t)                    ; Resize windows proportionally


;; TEST TAB
(defun my-insert-tab-char ()
  "Insert a tab char. (ASCII 9, \t)"
  (interactive)
  (insert "\t"))

(global-set-key (kbd "TAB") 'my-insert-tab-char) ; same as Ctrl+i




;; Auto indentation
(add-hook 'c-mode-common-hook (lambda ()
      (local-set-key (kbd "RET") 'newline-and-indent)))

;; Enable web-mode for html
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; Enable Flycheck
;(global-flycheck-mode)

;; Maximize window
;;(set-frame-parameter nil 'fullscreen 'fullboth)

;; Fringe
(set-fringe-mode 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                                      ;;
;; Email settings                                                                       ;;
;;                                                                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq user-mail-address "otoole.53@buckeyemail.osu.edu")
(setq user-full-name "Zachary M O'Toole")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                                      ;;
;; Org Mode Stuff                                                                       ;;
;;                                                                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-hide-leading-stars t)
(setq org-export-with-section-numbers nil)
(setq org-src-fontify-natively t)
;(setq company-math-allow-latex-symbols-in-faces t)
;(setq org-latex-inputenc-alist '(("utf8" . "utf8x")))
(setq org-html-validation-link nil)
