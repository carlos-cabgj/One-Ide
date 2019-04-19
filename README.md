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
            if filereadable($HOME . "/.vim/plugged/One-Ide/dist/1.4/one_ide.vim")</br>
                source $HOME/.vim/plugged/One-Ide/dist/1.4/one_ide.vim</br>
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

* One-IDE uses phpcd (need PHP installed) plugins and Silver Searcher (Ag), they both have a little more work to install.

<br/>
Ag https://github.com/ggreer/the_silver_searcher ( Binary for Windows https://github.com/k-takata/the_silver_searcher-win32/releases, set it in OneIde )
<br/>
* Vim airline needs powerfonts for use arrows;

<h3>Tutorial and Docs</h3>
Coming soon... OneIde
