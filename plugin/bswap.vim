if !exists("g:bswap_loaded")
	let g:bswap_loaded = 1
endif

let s:select_wins_chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

function! s:restore_statuslines(store) abort
	for winnr in keys(a:store)
		call setwinvar(winnr, '&statusline', a:store[winnr])
	endfor
endfunction

function s:store_statusline(store, winnr) abort 
	let a:store[a:winnr] = getwinvar(a:winnr, '&statusline')
endfunction

function! SwapBuffer()
	call bswap#exec(1)
endfunction

function! NavBuffer()
	call bswap#exec(0)
endfunction

function! bswap#exec(swap) abort
	let store = {}
	let char_idx_mapto_winnr = {}
	let char_idx = 0
	let curr_num = winnr()
	let curr_buff = bufnr("%")
	let curr_line = line(".")
	let curr_col = col(".")

	" update all the windows status lines with a letter
	for winnr in range(1, winnr('$'))
		let bufnr = winbufnr(winnr)
		call s:store_statusline(store, winnr)
		if winnr == curr_num
			continue
		endif
		let char_idx_mapto_winnr[char_idx] = winnr
		let char = s:select_wins_chars[char_idx]
		let statusline = printf('%%#Search#%s %s', repeat(' ', winwidth(winnr)/2-1), char)
		call setwinvar(winnr, '&statusline', statusline)
		let char_idx += 1
	endfor

	if len(char_idx_mapto_winnr) == 0
		call s:restore_statuslines(store)
	elseif len(char_idx_mapto_winnr) == 1
		call s:restore_statuslines(store)
	else
		redraw!
		let select_winnr = -1
		while 1
			echo 'Select buffer'
			let nr = getchar()
			if nr == 27 "ESC
				call s:restore_statuslines(store)
				return
			else
				let select_winnr = get(char_idx_mapto_winnr, string(nr - char2nr('a')), -1)
				if select_winnr != -1
					break
				endif
			endif
		endwhile
		call s:restore_statuslines(store)
		" move to selected window
		exe select_winnr . "wincmd w" 
		if a:swap
			let marked_buf = bufnr("%")
			let marked_line = line(".")
			let marked_col = col(".")
			exe 'hide buf' curr_buff
			exe curr_num . "wincmd w"
			call cursor(curr_line, curr_col)	
			exe 'hide buf' marked_buf
		endif
	endif
endfunction

command! -n=0 -bar SwapBuffer :call SwapBuffer()
command! -n=0 -bar NavBuffer :call NavBuffer()
