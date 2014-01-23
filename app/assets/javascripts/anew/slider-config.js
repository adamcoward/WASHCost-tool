$(document).ready(function(){

    //---> Basic tool sliders

    // Text Field Slider Configurator



    // Population Slider


    // Capital slider
    capitalSlider = $( "#capitalSlider" );
    if(capitalSlider.length > 0){
//        inputCapital = $('input[name="capital"]');
        //default
//        inputCapital.val(0);
        offset_cursor = 4;
        offset_label_currency= 14;
        bar_slider_lenght = capitalSlider.width()*1.00;

        slider_lenght = inputCapital.data('max-value') - inputCapital.data('min-value');
        above_value = inputCapital.data('above-value');
        below_value = inputCapital.data('below-value');
        step_slider = bar_slider_lenght/slider_lenght;
        css_above_value = above_value * step_slider + offset_cursor;
        css_below_value = below_value * step_slider + offset_cursor;
        //labels
        label_first = $('.labelScale li.first');
        label_first.css('left',css_below_value-offset_cursor-offset_label_currency+"px");
        label_last = $('.labelScale li.last');
        label_last.css('left',css_above_value-label_last.width()-offset_cursor-offset_label_currency+"px");
        //Modifying bag position in X axis
        capitalSlider.css('backgroundPosition', css_above_value+"px 1px, "+css_below_value+"px 0px, 1px 0px");
/*        $('.slider-container.threshold-marks').css('backgroundPosition', css_above_value+"px 1px, "+css_below_value+"px 0px, 1px 0px");
        slider_display = function(event,ui) {
            inputCapital.val(ui.value);
            //$('#capitalValue').html(ui.value);
            $('.container-value #text_field').val(ui.value);
        };
        capitalSlider.slider({
            min: inputCapital.data('min-value'),
            max: inputCapital.data('max-value'),
            change: slider_display,
            slide: slider_display
        });
        slider_value = capitalSlider.attr('data-slider_value');
        capitalSlider.slider({value: slider_value});*/
    }

    // Recurrent Slider
    recurrentSlider = $("#recurrentSlider");
    if(recurrentSlider.length > 0){
        inputRecurrent = $('input[name="recurrent"]');
        //default
        inputRecurrent.val(3);
        offset_cursor = 4;
        offset_label_currency= 14;
        bar_slider_lenght = recurrentSlider.width()*1.00;
        slider_lenght = inputRecurrent.data('max-value') - inputRecurrent.data('min-value');
        above_value = inputRecurrent.data('above-value');
        below_value = inputRecurrent.data('below-value');
        step_slider = bar_slider_lenght/slider_lenght;
        css_above_value = above_value * step_slider + offset_cursor;
        css_below_value = below_value * step_slider + offset_cursor;
        //labels
        label_first = $('.labelScale li.first');
        label_first.css('left',css_below_value-offset_cursor-offset_label_currency+"px");
        label_last = $('.labelScale li.last');
        label_last.css('left',css_above_value-label_last.width()-offset_cursor-offset_label_currency+"px");

        recurrentSlider.css('backgroundPosition', css_above_value+"px 1px, "+css_below_value+"px 0px, 1px 0px");
        slider_display = function( event, ui ) {
            inputRecurrent.val(ui.value);
            //$('#recurrentValue').html(ui.value);
            $('.container-value #text_field').val(ui.value);
        };
        recurrentSlider.slider({
            min: inputRecurrent.data('min-value'),
            max: inputRecurrent.data('max-value'),
            change: slider_display,
            slide: slider_display
        });
        slider_value = recurrentSlider.attr("data-slider_value");
        recurrentSlider.slider({value: slider_value});
    }

    // Time & Distance Slider
//    timeSlider = $('#timeSlider');
//    if(timeSlider.length > 0){
//
//        //default
//        $('input[name="time"]').val(0);
//        slider_display = function(event, ui) {
//            $('input[name="time"]').val(ui.value);
//            $('#timeValue').html(I18n["en"]["form"]["water_basic"]["time"]['answers']['a'+ui.value]);
//        }
//        timeSlider.slider({
//            min: 0,
//            max: 3,
//            step: 1,
//            change: slider_display,
//            slide: slider_display
//        });
//        slider_value = $('#timeValue').attr("data-slider_value");
//        timeSlider.slider({value: slider_value});
//    }

});
