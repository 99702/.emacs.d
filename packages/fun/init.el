;;; angular toggle .ts / .html files ;;;
(defun open-corresponding-angular-component ()
  "Open the related file based on the current buffer's file name."
  (interactive)
  (let* ((file-name (buffer-file-name))
         (base-name (file-name-nondirectory file-name))
         (extension (file-name-extension file-name)))
    (if (string= extension "ts")
        (let ((related-file (concat (file-name-directory file-name)
                                    (file-name-sans-extension base-name)
                                    ".html")))
          (if (file-exists-p related-file)
              (find-file related-file)
            (message "No related HTML file found.")))
      (if (string= extension "html")
          (let ((related-file (concat (file-name-directory file-name)
                                      (file-name-sans-extension base-name)
                                      ".ts")))
            (if (file-exists-p related-file)
                (find-file related-file)
              (message "No related TS file found.")))
        (message "Unsupported file type.")))))

(define-key evil-normal-state-map (kbd "SPC SPC") 'open-corresponding-angular-component)

;; insert random words of given length in the cursor location
(defun generate-random-words (n)
  "Generate n non-repeated random words from a list of words and write them into the buffer where the cursor is located."
  (interactive "nNumber of words to generate: ")
  (let* ((words '("apple" "banana" "cherry" "date" "elderberry" "fig" "grape" "honeydew" "orange" "pear" "quince" "raspberry" "strawberry" "tangerine" "watermelon"))
         (num-words (length words))
         (random-words (make-hash-table :test 'equal))
         (buffer (current-buffer)))
    (dotimes (i n)
      (let ((random-word (nth (random num-words) words)))
        (while (gethash random-word random-words)
          (setq random-word (nth (random num-words) words)))
        (puthash random-word t random-words)
        (insert random-word)
        (when (< i (- n 1))
          (insert " "))))
    (insert "\n")))



(defun open-in-nautilus ()
  (interactive)
  (let ((file (buffer-file-name)))
    (if file
        (if (file-directory-p file)
            (setq file (concat file "/")))
      (setq file default-directory))
    (start-process "nautilus" nil "nautilus" file)))
