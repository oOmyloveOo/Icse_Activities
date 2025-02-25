$(document).ready(function () {
    $('td').click(function(event) {
        var color = $('.board').css('background-color');
        if (color) {
            $(event.target).css('background-color', color);
        }
    });
    createColorPicker();
});

function createColorPicker() {
    $('#toggle').spectrum({
        type: "color",
        togglePaletteOnly: true,
        hideAfterPaletteSelect: false,
        showInput: true,
        showInitial: true,
        change: function(color) {
            if (color != null) {
                $('.board').css('background-color', color.toHexString());
            }
        }
    });
}

