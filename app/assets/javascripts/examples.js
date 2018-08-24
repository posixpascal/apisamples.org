$(function(){
    var highlightBlocks = function(){
        $('pre code').each(function(i, block) {
            hljs.highlightBlock(block);
        });
    };

    highlightBlocks();

    document.addEventListener("turbolinks:load", highlightBlocks);
});