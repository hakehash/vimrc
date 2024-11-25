;; (require 'profiler)
;; (profiler-start 'cpu)
(global-font-lock-mode t)
(add-hook 'tty-setup-hook
          (lambda ()
            (set-terminal-parameter nil 'background-mode 'dark)))
(setq global-auto-revert-mode t)
(setq column-number-mode t)
(setq line-number-mode t)
(setq display-time-interval 1)
(setq display-time-format "%T")
(display-time)
(setq electric-indent-mode 0)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'left)
(set-scroll-bar-mode 'right)
(setq inhibit-startup-echo-area-message (user-login-name))
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(if (>= emacs-major-version 28)
  (fido-vertical-mode 1)
  )
(savehist-mode 1)
(setq make-backup-files nil)
(setq quail-japanese-use-double-n t)
(setq visible-bell t)
(setq windmove-wrap-around t)
(setq zoneinfo-style-world-list
  '(("Europe/London" "London")
    ("Europe/Rome" "Rome")
    ("Europe/Moscow" "Moscow")
    ("Asia/Tokyo" "Tokyo")))
(defun fairfield (m d)
  (setq y (elt (decode-time (current-time) "UTC0") 5))
  (mod (+ (* 365 y) (floor y 4) (- (floor y 100)) (floor y 400) (floor (* 306 (+ m 1)) 10) d -428) 7))
(setq mars (- 31 (fairfield 3 31)))
(setq octe (- 31 (fairfield 10 31)))
(setq m (elt (decode-time (current-time) "UTC0") 4))
(setq d (elt (decode-time (current-time) "UTC0") 3))
(setq h (elt (decode-time (current-time) "UTC0") 2))
(if (or (< m 3)
        (and (= m 3) (< d mars))
        (and (= m 3) (= d mars) (< h 1))
        (> m 10)
        (and (= m 10) (> d octe))
        (and (= m 10) (= d octe) (>= h 1)))
  (setq legacy-style-world-list
    '(("GMT0" "London")
      ("GMT-3MSK" "Moscow")
      ("JST-9" "Tokyo")))
  (setq legacy-style-world-list
    '(("GMT-1BST" "London")
      ("GMT-3MSK" "Moscow")
      ("JST-9" "Tokyo"))))
(set-language-environment 'Japanese)
(quail-define-package
  "russian-computer-oadg106" "Russian" "RU" nil
  "ЙЦУКЕН Russian computer layout for OADG 106 keyboard"
  nil t t t t nil nil nil nil nil t)

;; 1! 2" 3№ 4; 5% 6: 7? 8( 9) 0 -_ =+ \/
;;  Й Ц У К Е Н Г Ш Щ З х ъ
;;   Ф Ы В А П Р О Л Д ж э ё
;;    Я Ч С М И Т Ь б ю ., \_

(quail-define-rules
  ("1" ?1) ("2" ?2) ("3" ?3) ("4" ?4) ("5" ?5)
  ("6" ?6) ("7" ?7) ("8" ?8) ("9" ?9) ("0" ?0) ("-" ?-) ("^" ?=) ("\\" ?\\)
  ("q" ?й) ("w" ?ц) ("e" ?у) ("r" ?к) ("t" ?е) ("y" ?н)
  ("u" ?г) ("i" ?ш) ("o" ?щ) ("p" ?з) ("@" ?х) ("[" ?ъ)
  ("a" ?ф) ("s" ?ы) ("d" ?в) ("f" ?а) ("g" ?п) ("h" ?р)
  ("j" ?о) ("k" ?л) ("l" ?д) (";" ?ж) (":" ?э) ("]" ?ё)
  ("z" ?я) ("x" ?ч) ("c" ?с) ("v" ?м) ("b" ?и)
  ("n" ?т) ("m" ?ь) ("," ?б) ("." ?ю) ("/" ?.)
  ("!" ?!) ("\"" ?\") ("#" ?№) ("$" ?\;) ("%" ?%) ("&" ?:)
  ("'" ??) ("(" ?\() (")" ?\)) ("=" ?_) ("~" ?+) ("|" ?/)
  ("Q" ?Й) ("W" ?Ц) ("E" ?У) ("R" ?К) ("T" ?Е) ("Y" ?Н)
  ("U" ?Г) ("I" ?Ш) ("O" ?Щ) ("P" ?З) ("`" ?Х) ("{" ?Ъ)
  ("A" ?Ф) ("S" ?Ы) ("D" ?В) ("F" ?А) ("G" ?П) ("H" ?Р)
  ("J" ?О) ("K" ?Л) ("L" ?Д) ("+" ?Ж) ("*" ?Э) ("}" ?Ё)
  ("Z" ?Я) ("X" ?Ч) ("C" ?С) ("V" ?М) ("B" ?И)
  ("N" ?Т) ("M" ?Ь) ("<" ?Б) (">" ?Ю) ("?" ?,))

(require 'skk-setup)
(setq skk-auto-insert-paren t)
(setq skk-dcomp-activate t)
(setq skk-dcomp-multiple-activate nil)
(setq skk-delete-implies-kakutei nil)
(setq skk-egg-like-newline t)
(setq skk-henkan-strict-okuri-precedence t)
(setq skk-preload t)
(setq skk-search-katakana nil)
(setq skk-show-annotation t)
(setq skk-use-azik t)
;; (setq skk-use-kana-keyboard t)
;; (setq skk-kanagaki-keyboard-type '106-jis)
(if (string-match "^\\(MPC\\|pomera$\\)" (system-name))
  (progn
    (setq default-input-method "russian-computer-oadg106")
    (setq skk-azik-keyboard-type 'jp106))
  (setq default-input-method "russian-computer")
  (setq skk-azik-keyboard-type 'us101)
  )
(if (>= emacs-major-version 26)
  (setq default-fill-column (default-value 'fill-column))
  )
(when (>= emacs-major-version 24)
  (when (<= emacs-minor-version 2)
    (require 'cl-lib)
    )
  (if (>= emacs-major-version 28)
    (setq evil-undo-system 'undo-redo)
    (require 'undo-fu)
    (setq evil-undo-system 'undo-fu)
    )
  )
(setq evil-mode-line-format '(before . mode-line-front-space))
(setq evil-normal-state-tag "     ")
(setq evil-shift-width 2)
(setq evil-want-C-u-scroll t)
(setq evil-want-C-w-in-emacs-state t)
(setq evil-want-fine-undo nil)
(setq evil-want-Y-yank-to-eol t)
(require 'evil)
(evil-mode 1)
(define-key evil-motion-state-map (kbd ";") 'evil-ex)
(define-key evil-motion-state-map (kbd ":") 'evil-repeat-find-char)
(require 'evil-numbers)
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-q") 'evil-numbers/dec-at-pt)
(when (eq system-type 'windows-nt)
  (if (file-directory-p (substitute-in-file-name "${USERPROFILE}/Documents"))
    (cd (substitute-in-file-name "${USERPROFILE}/Documents"))
    )
  )
(when (eq window-system 'w32)
  (set-face-background 'default "Light Yellow"))
(when (eq window-system nil)
  (menu-bar-mode -1))
(require 'server)
(unless (server-running-p)
  (server-start))
(prefer-coding-system 'utf-8)
;; (profiler-report)
;; (profiler-stop)
;; (setq quail-japanese-transliteration-rules
;; (defvar skk-101-jisx6004-plain-rule-list
;; '(?b ("ア" . "あ") ?k ("イ" . "い") ?j ("ウ" . "う") ?U ("エ" . "え") ?J ("オ" . "お")
;;   ?s ("カ" . "か") ?; ("キ" . "き") ?h ("ク" . "く") ?w ("ケ" . "け") ?x ("コ" . "こ")
;;   ?v ("サ" . "さ") ?d ("シ" . "し") ?z ("ス" . "す") ?e ("セ" . "せ") ?q ("ソ" . "そ")
;;   ?g ("タ" . "た") ?[ ("チ" . "ち") ?y ("ツ" . "つ") ?r ("テ" . "て") ?f ("ト" . "と")
;;   ?' ("ナ" . "な") ?c ("ニ" . "に") ?P ("ヌ" . "ぬ") ?V ("ネ" . "ね") ?i ("ホ" . "の")
;;   ?a ("ハ" . "は") ?Y ("ヒ" . "ひ") ?R ("フ" . "ふ") ?S ("へ" . "へ") ?E ("ホ" . "ほ")
;;   ?H ("マ" . "ま") ?I ("ミ" . "み") ?N ("ム" . "む") ?T ("メ" . "め") ?K ("モ" . "も")
;;   ?O ("ヤ" . "や")                  ?: ("ユ" . "ゆ")                  ?G ("ヨ" . "よ")
;;   ?D ("ラ" . "ら") ?p ("リ" . "り") ?m ("ル" . "る") ?/ ("レ" . "れ") ?M ("ロ" . "ろ")
;;   ?L ("ワ" . "わ")                  ?o ("ヲ" . "を")                  ?u ("ン" . "ん")
;;   ("sl" "が") (";l" "ぎ") ("hl" "ぐ") ("wl" "げ") ("xl" "ご")
;;   ("vl" "ざ") ("dl" "じ") ("zl" "ず") ("el" "ぜ") ("ql" "ぞ")
;;   ("gl" "だ") ("[l" "ぢ") ("yl" "づ") ("rl" "で") ("fl" "ど")
;;   ("al" "ば") ("Yl" "び") ("Rl" "ぶ") ("Sl" "べ") ("El" "ぼ")
;;   ("aW" "ぱ") ("YW" "ぴ") ("RW" "ぷ") ("SW" "ぺ") ("EW" "ぽ")
;;   ?Q ("ァ" . "ぁ") ?A ("ィ" . "ぃ") ?Z ("ゥ" . "ぅ") ?X ("ェ" . "ぇ") ?C ("ォ" . "ぉ")
;;   ?n ("ッ" . "っ") ?B ("ャ" . "ゃ") ?F ("ュ" . "ゅ") ?t ("ョ" . "ょ")
;;   ?, ("、") ?. ("。") ?l ("゛") ?W ("゜")
;;   ?{ ("「") ?\ ("」") ?< ("・") ?> ("ー")))
