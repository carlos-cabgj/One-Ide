## One-IDE
<p>The last IDE that you gonna learn</p>

<h4>What it is?</h4>

One-IDE brings defaults set ups for transform your vim into an IDE with all power of VIM.
The objective is :

<ul>
    <li>Select plugins for enhance the work;</li>
    <li>Turn easy the curve of learning Vim. Will not be necessary searching and learning how to use VIM as a IDE;</li>
    <li>A same IDE through every OS working and that work  through  the terminal, so you can connect from SSH and work normally;</li>
    <li>In my career I used to work with many others IDEs like  IntelliJ IDEA, Zend Studio, Eclipse, Netbeans... But I always had issues like licence, speed, colors, plugins. One-IDE solve those problems gathering tested great plugins available on github.</li>
</ul>

<h4>Why VIM?</h4>

As a developers, we always think about this question "What IDE must I choose? ", "Vim, Emacs or Nano?". I really like Emacs, but I rather Vim for this project because:
<ol>
    <li>Vim is standard in many OS;</li>
    <li>Vim Interface is notable, it have another idea and is light;</li>
    <li>Vim have (in my opinion) a better community support.</li>
</ol>

The version is VIM8, only because more people are using it. But fell free to use others versions.


<h4>Installation</h4>

You must have the vim installed in your system.

<ol>
    <li>Install vim-plug. Every thing that will be installed will be with this plugin Check https://github.com/junegunn/vim-plug and install in your vim;</li>
    <li>Put the content of default.vimrc in your .vimrc or replace the file. Attention! Check if your .vimrc file exist!
        Now you must choose your configuration for example <br/>
        <p>
            call plug#begin()</br>
            Plug 'carlos-cabgj/One-Ide'</br>
            let g:One_Ide_options = ['php', 'js']</br>
            if filereadable($HOME . "/.vim/plugged/One-Ide/dist/2.0b/one_ide.vim")</br>
                source $HOME/.vim/plugged/One-Ide/dist/2.0b/one_ide.vim</br>
            endif</br>
            call plug#end()</br>
        </p>
        In g:One_Ide_options you can choose the libraries, at this moment, only js (html, js, jsx, less) and php configurations.
    </li>
    <li>Open vim, run :PlugInstall one time for install the OneIde, close and do the same thing again for install the plugins.</li>
    <li>Attention! if you are using vim on windows, would be necessary change the file path</li>
    <li>Enjoy!</li>
</ol>

This is the first commit of One-IDE. The documentation Will be release soon.

I'm alone testing those plugins and writing configurations, docs and tutorial from them, please if you want to collaborate I will be glad to have new team members.

<h3>Tutorial and Docs</h3>
<pre>
 ____ ____ ____ _________ ____ ____ ____ 
||O |||N |||E |||       |||I |||D |||E ||
||__|||__|||__|||_______|||__|||__|||__||
|/__\|/__\|/__\|/_______\|/__\|/__\|/__\|

</pre>

Vim is a little bit hard to learn, so ... for a quick tutorial here, follow this guide with those informations in mind:
<br/>
Vim have difirente modes, and Vim wiil be alway in one mode by time, and you need to use them :
Visual, normal, inser, select, command-line and ex-mode
try to switch modes besides to emulate one mode inside other
<p>
OneIde bring the mouse suport on, but use only if necessary
</p>
1   ) Navigation <br/>
2   ) Manipulaiton<br/>
3   ) TIPS<br/>
4   ) ONEIDE SETUP!<br/>
5   ) FUNCTIONS<br/>
5.1 ) OneIde Crypt<br/>
5.2 ) OneIde AutoDeploy<br/>
6   ) PLUGINS used and tips<br/>

1)
<pre>
  ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ 
||N |||a |||v |||i |||g |||a |||t |||i |||o |||n ||
||__|||__|||__|||__|||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|

( in normal mode )

First part
    left = h, down = j, up = k, right = l
        you can plus this moviment typing a number before the letter. 10 + j, go ten times down
Second part
    w = jump to the begginer of next word
    e = jump to the last of next word
    b = jump to the back of last word
        You can use B,W or E, to jump some cases better
    $ = jump to the end of line
    ^ = jump to the begginer of line ( pay attention, is some keyboards you will need to press space )
    f + {letter} = jump foward to the next choosed letter
    F + {letter} = jump Backward
    : + {line number} = jump to the line number
    G = go to the end of the file
    gg = go to the first line of the file
Third part
    Easy mottion type twice \\ and + w or + b to decide to move foward or backwards. After choosing the place typing the coordnades 
    The plugin Ack will help you to navigate around your project, look at plugins part
    / + {searched} = Enter in command line mode and start to search in this document the term ( is necessary escape the spaces )
    Swift + * = search the word under cursor
    searching will start to highlight the searched in the document encounters, to go forwar and back use 
    n, N : go foward and back the searching term

Or ... use the mouse if you needed, but try to avoid this.
</pre>
2)
<pre>
 ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ 
||M |||A |||N |||I |||P |||U |||L |||A |||T |||I |||O |||N ||
||__|||__|||__|||__|||__|||__|||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|

( in normal mode )

Insert (Entering in the insert mode )
    i   = open insert mode AFTER cursor
    a   = open insert mode BEFORE cursor
    o   = open insert mode in next line, indented
    A,I = do the same thing, but at the beggenign or end of line
    s   = open insert mode erasing the selection under cursor
    S   = delete the whole line and enter in insert mode and indented

Exclude
    x  = to exclude under the cursor (or the selection) ( in OneIde, this option will not yank the selection )
    d  = to exclude under the cursor (or the selection)
    dd = exclude whole line
    dwa = erase the word under cursor

Select ( Entering in de visual mode )
    v        = enter in visual mode, and select the content starting under the cursor
    gv       = enter in visual mode, and select the last visual selection
    V        = enter in visual mode, and select the whole line
    ctrl + v = enter in visual mode, and select the content starting under the cursor verticaly, after that you can use I,A, P .... 

Or ... use the mouse, double click will select the word, and click and drag the "v" behavior

Copy and Paste
    y = yank the selection
    p = paste text after cursor
    P = paste text before cursor
    ctrl + C = work for copy the selected, but copy to clipboard
    ctrl + V = work for paste the selected from clipboard
</pre>
3)
<pre>
 ____ ____ ____ ____ 
||t |||i |||p |||s ||
||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|


Switch Case
    u,U = transform tex to lower or upper case
Go to end of block
    % = type the begginer of the block like { of if
</pre>
4)
<pre>
 ____ ____ ____ ____ ____ ____ _________ ____ ____ ____ ____ ____ ____ 
||O |||N |||E |||I |||D |||E |||       |||S |||E |||T |||U |||P |||! ||
||__|||__|||__|||__|||__|||__|||_______|||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|/_______\|/__\|/__\|/__\|/__\|/__\|/__\|
</pre>

ctrl + f         = do the same as ESC, and clear the last search result ( when used in the normal mode )
gn, gp           = change buffer to next or previous
gd , gD          = close buffer, and close buffer without saving
Tab, shift + Tab = Indent in visual and insert mode
f8               = will change colors of vim

In OneIde 
You can change buffers withour saving 
indenting is with 4 spaces
Line numbers always on
.one-project is the file that define a project in ONEIDE the actual structure is :

{
    "encryption": {
        "status" : 0,
        "mode" : 'fullDecrypt',
        "pathDecode" : 'fullPath'
    },
    "autodeploy": {
        "status" : 0,
        "type" : "sftp",
        "host" : "",
        "port" : "",
        "user" : "",
        "pass" : "",
        "pathServer" : 'fullPath',
        "pathLocal" : 'path'
    }
}
<p>encryption.status : 0 - off, 1 - on<br />
encryption.mode : still not used<br />
encryption.pathDecode : if declared, when saved, one copy of the file, not encrypted will be in this path</p>

<p>autodeploy.status : 0 - off, 1 - on<br />
autodeploy.type : still not used<br />
autodeploy.program : only PSCPPLINK is available now<br />
autodeploy.plink : pash to plink executable<br />
autodeploy.pscp : pash to pscp executable<br />
autodeploy.pathServer : path to deploy the files is the server<br />
autodeploy.pathLocal : pash to start localy</p>


5)
<pre>
 ____ ____ ____ ____ ____ ____ ____ ____ ____ 
||F |||U |||N |||C |||T |||I |||O |||N |||S ||
||__|||__|||__|||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|


5.1) OneIde Crypt

    OneIdeCrypt uses Vim blowfish2 to encode your project.
    For use set you encryption = 1 in your .one-project
    Encode you whole project, after that you will be asked a password ( REMEMBER YOU PASSWORD )
    After that, every time that you enter in your project, you will be asked the password at the beggining

    :OneProjectAddPassword 
        Open a file in your one-project and use this function to define the password of the project

    :OneProjectDecrypt
        Open a file in your one-project and use this function to decode your project to the path defined in .one-project
        "pathDecode".
        If a password was defined, It will use the current password to decrypt or you will be asked a new one.

    :ProjectEncrypt
        Open a file in your one-project and use this function for encrypt your whole project
        Caution! protect and remember your password


5.2) OneIde AutoDeploy
    OneIde bring on more functionality to your project.
    AutoDeploy permit that every time that you save your file, It will be sent to a new destination!
    Set in your .one-project file "autodeploy" {status : 1}, and choose your configuration with :
    host = host of the server
    port = for connection
    user = user for login
    pass = for login
    pathServer = path where the files will be saved in the server
    pathLocal = if needed to define a new path, use \ to avoid this

    Now AutoDeploy only work with sftp using pscp, I'm working for be available with putty and linux tools too.
</pre>
6)
<pre>
 ____ ____ ____ ____ ____ ____ ____ 
||P |||L |||U |||G |||I |||N |||S ||
||__|||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|/__\|


used and tips

"Development Tools

majutsushi/tagbar
tope/vim-surround
tpope/vim-commentary
w0rp/ale
ludovicchabant/vim-gutentags
skywind3000/gutentags_plus
mbbill/undotree
-----------------
brooth/far.vim
-----------------
Far work only with existed files, so if you create a new file withour saving it, you will not have any results.

After that you will be redirect to check tab.
    Use x to exclude item
    Use a to add item
    Use t to toggle item

:Far searched replaced **.*

Simple in the same file
:Far searched replaced %

Selected text in visual and type 
:'<,'>Far * replaced %

-----------------
nathanaelkane/vim-indent-guides
godlygeek/tabular

Shougo/deoplete.nvim
roxma/nvim-yarp
roxma/vim-hug-neovim-rpc
Shougo/neosnippet.vim
Shougo/neosnippet-snippets
honza/vim-snippets
skywind3000/asyncrun.vim

" Tools
scrooloose/nerdtree
vim-airline/vim-airline
flazz/vim-colorschemes
terryma/vim-multiple-cursors
easymotion/vim-easymotion
tpope/vim-fugitive
osyo-manga/vim-anzu

"Searchers
mileszs/ack.vim
kien/ctrlp.vim
</pre>


* One-IDE uses phpcd (need PHP installed) plugins and Silver Searcher (Ag), they both have a little more work to install.
<br/>
Ag https://github.com/ggreer/the_silver_searcher ( Binary for Windows https://github.com/k-takata/the_silver_searcher-win32/releases, set it in OneIde )
<br/>
Ctags binary for Windows
https://github.com/universal-ctags/ctags-win32
<br/>
* Vim airline needs powerfonts for use arrows;
https://stackoverflow.com/questions/1864394/vim-and-nerd-tree-closing-a-buffer-properly
