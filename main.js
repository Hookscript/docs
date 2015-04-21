$( function() {
    // changing the language preference
    $('.js-preferred-language').change(function(e) {
        var lang = $(e.target).val();
        show_only(lang);
    });

    // default to showing Perl documentation
    var lang = previously_preferred_language();
    $('.js-preferred-language').val(lang);
    show_only(lang);

    // language selector is always visible
    var menu = $('#header'),
        pos = menu.offset();

    $(window).scroll(function () {
        if ($(this).scrollTop() > pos.top + menu.height()) {
            $('#lang').addClass('js-fixed').fadeIn('fast');
        } else if ($(this).scrollTop() <= pos.top) {
            $('#lang').removeClass('js-fixed').fadeIn('fast');
        }
    });
});

// Returns the language which this user preferred the last time
// he visited our site.
function previously_preferred_language() {
    return localStorage["preferred-language"] || "perl";
}

// Show only code snippets and content associated with the
// language 'lang'
function show_only(lang) {
    // hide everything
    $('div.highlight').hide();
    $('span.language-specific').hide();

    // show the language we want
    var code = $('div.highlight code.language-' + lang);
    code.closest('div.highlight').show();
    $('.language-specific.language-'+lang).show();

    // remember this preference for next time
    localStorage["preferred-language"] = lang;
}
