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

## Credit where credit is due

A lot of this is borrowed from some useful functionality I liked from [Coc-Explorer](https://github.com/weirongxu/coc-explorer)
