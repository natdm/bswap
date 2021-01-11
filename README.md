# bswap

bswap.vim gives the ability to easily rearrange or navigate buffers in split windows.

*By default, nothing is mapped for you.* Feel free to call the functions or map to your own mappings

The exported functions are `:SwapBuffer` and `:NavBuffer`.

## Example mapping

```vim
nnoremap <leader>ne :NavBuffer<CR>
nnoremap <leader>nn :SwapBuffer<CR>
```

## `SwapBuffer()`

SwapBuffer will label all the open buffers (except the current buffer) with an alphanumeric character. 
Enter the character to swap the current buffer and the selected buffer. The cursor will remain in the same window, with the selected buffer contents.

![Swap Example](/images/swap.gif)

## `NavBuffer()`

NavBuffer will do the exact same as SwapBuffer, except it will send you to that buffer and not swap the contents.

![Nav Example](/images/nav.gif)

## Options

Just one option, `g:bswap_color`. Look at `:so $VIMRUNTIME/syntax/hitest.vim` and select a color to change it to if the default does not suit you. 
Currently, it's set to "Search". Override it with `let g:bswap_color = "SomeOtherColor"`

## Credit where credit is due

A lot of this is borrowed from some useful functionality I liked from [Coc-Explorer](https://github.com/weirongxu/coc-explorer)

