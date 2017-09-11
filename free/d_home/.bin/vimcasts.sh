#!/bin/sh

_print_url()
{
   cat << EOF
http://vimcasts.org/episodes/ultisnips-visual-placeholder/
http://vimcasts.org/episodes/ultisnips-python-interpolation/
http://vimcasts.org/episodes/meet-ultisnips/
http://vimcasts.org/episodes/swapping-two-regions-of-text-with-exchange-vim/
http://vimcasts.org/episodes/using-external-filter-commands-to-reformat-html/
http://vimcasts.org/episodes/operating-on-search-matches-using-gn/
http://vimcasts.org/episodes/creating-mappings-that-accept-a-count/
http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
http://vimcasts.org/episodes/comparing-buffers-with-vimdiff/
http://vimcasts.org/episodes/using-vims-paste-mode-with-the-system-paste-command/
http://vimcasts.org/episodes/accessing-the-system-clipboard-from-vim/
http://vimcasts.org/episodes/evaluating-scripts-with-vims-expression-register/
http://vimcasts.org/episodes/simple-calculations-with-vims-expression-register/
http://vimcasts.org/episodes/pasting-from-insert-mode/
http://vimcasts.org/episodes/pasting-from-visual-mode/
http://vimcasts.org/episodes/using-vims-named-registers/
http://vimcasts.org/episodes/meet-the-yank-register/
http://vimcasts.org/episodes/simple-operations-using-the-default-register/
http://vimcasts.org/episodes/an-introduction-to-vspec/
http://vimcasts.org/episodes/enhanced-abbreviations-with-abolish/
http://vimcasts.org/episodes/supercharged-substitution-with-subvert/
http://vimcasts.org/episodes/smart-search-with-subvert/
http://vimcasts.org/episodes/search-for-the-selected-text/
http://vimcasts.org/episodes/project-wide-find-and-replace/
http://vimcasts.org/episodes/search-multiple-files-with-vimgrep/
http://vimcasts.org/episodes/using-argdo-to-change-multiple-files/
http://vimcasts.org/episodes/populating-the-arglist/
http://vimcasts.org/episodes/meet-the-arglist/
http://vimcasts.org/episodes/long-range-line-duplication/
http://vimcasts.org/episodes/profiling-vimscript-performance/
http://vimcasts.org/episodes/writing-a-custom-fold-expression/
http://vimcasts.org/episodes/how-to-fold/
http://vimcasts.org/episodes/vimgolf-prime-numbers/
http://vimcasts.org/episodes/fugitive-vim-exploring-the-history-of-a-git-repository/
http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/
http://vimcasts.org/episodes/fugitive-vim-working-with-the-git-index/
http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/
http://vimcasts.org/episodes/undo-branching-and-gundo-vim/
http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
http://vimcasts.org/episodes/refining-search-patterns-with-the-command-line-window/
http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
http://vimcasts.org/episodes/bubbling-text/
http://vimcasts.org/episodes/creating-colorschemes-for-vim/
http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
http://vimcasts.org/episodes/converting-haml-to-erb-with-vim-macros/
http://vimcasts.org/episodes/selecting-columns-with-visual-block-mode/
http://vimcasts.org/episodes/converting-markdown-to-structured-html-with-a-macro/
http://vimcasts.org/episodes/running-vim-within-irb/
http://vimcasts.org/episodes/spell-checking/
http://vimcasts.org/episodes/formatting-text-with-par/
http://vimcasts.org/episodes/hard-wrapping-text/
http://vimcasts.org/episodes/soft-wrapping-text/
http://vimcasts.org/episodes/the-file-explorer/
http://vimcasts.org/episodes/the-edit-command/
http://vimcasts.org/episodes/cleaning-up-with-vim/
http://vimcasts.org/episodes/modal-editing-undo-redo-and-repeat/
http://vimcasts.org/episodes/using-the-changelist-and-jumplist/
http://vimcasts.org/episodes/creating-the-vimcasts-logo-as-ascii-art/
http://vimcasts.org/episodes/how-to-use-tabs/
http://vimcasts.org/episodes/working-with-tabs/
http://vimcasts.org/episodes/working-with-windows/
http://vimcasts.org/episodes/working-with-buffers/
http://vimcasts.org/episodes/indentation-commands/
http://vimcasts.org/episodes/tidying-whitespace/
http://vimcasts.org/episodes/whitespace-preferences-and-filetypes/
http://vimcasts.org/episodes/tabs-and-spaces/
http://vimcasts.org/episodes/show-invisibles/
EOF
}

_get()
{
   while read URL; do
      youtube-dl "$URL"
   done
}

_print_url | _get

exit 0
