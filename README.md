# onitra
<p>The last IDE that you gonna learn</p>


<h4>What it is?</h4>

Onitra brings defaults set ups for transform your vim into an IDE with all power of VIM.
The objective is :

<ul>
    <li>Select plugins for enhance the work;</li>
    <li>Turn easy the curve of learning Vim. Will not be necessary searching and learning how to use VIM as a IDE;</li>
    <li>A same IDE through every OS working and that work  through  the terminal, so you can connect from SSH and work normally;</li>
    <li>In my career I used to work with many others IDEs like  IntelliJ IDEA, Zend Studio, Eclipse, Netbeans... But I always had issues like licence, speed, colors, plugins. Onitra solve those problems gathering tested great plugins available on github.</li>
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
    <li>Install vim-plug. Every thing that will be installed will be with this plugin
    Check https://github.com/junegunn/vim-plug and install in your vim;</li>

    <li>Put the content of default.vimrc in your .vimrc or replace the file.
    Attention! Check if your .vimrc file exist!</li>

    <li>Put the file noitra.vim inside you .vim/ folder;</li>

    <li>Open vim, type :PlugInstall and wait the instalation;</li>

    <li>Edit you .vimrc and uncommit the line with this content "#source ~/.vim/onitra.vim".
    Attention! if you are using vim on windows, would be necessary change the file path;</li>

    <li>Enjoy!</li>
</ol>



This is the first commit of Onitra. The documentation Will be release soon.

I'm alone testing those plugins and writing configurations, docs and tutorial from them, please if you want to collaborate I will be glad to have new team members.
