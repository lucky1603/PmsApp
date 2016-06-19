/**
 * @description This file handles actions about the update and mangement of value options of a html form select element.
 * @type String
 * @author Sinisa
 */

var optionsArea;
var counter = 1;
var model;

$(document).ready(function() {
    var counter = 1;    
    optionsArea = '<div class="optionsArea"><button type="button" id="addButton" class="btn btn-default glyphicon glyphicon-plus">   </button></div>';
    var optionsEntry = '<div class="option-value"><div class="col-sm-2"><input type="text" id="val"' + counter + '>value here...</input></div><div class="col-sm-2"><input type="text" id="val"'+counter+'>text here...</input></div><button type="button" id="removeEntries" class="btn btn-default glyphicon glyphicon-remove">remove</button></div>';
    $('.attr-type').on('change', function(evt) {
        initEntries();
    });

});

function initEntries(attributeModel)
{
    if(attributeModel != null)
    {
        model = attributeModel;
    }
        
    if($('.attr-type').val() == 'select')
    {   
        $('.attr-type').after($(optionsArea));
        $('#addButton').click(function(evt) {
            evt.preventDefault();
            var optionsEntry = '<div class="option-value"><div class="form-group"><div class="col-xs-4"><input type="text" name="val'+counter+'" id="val' + counter + '" class="form-control"></div><div class="col-xs-4"><input type="text" name="text'+counter+'" id="text'+counter+'" class="form-control"></div><button type="button" id="btn'+counter+'" class="removeEntries btn btn-default glyphicon glyphicon-remove">   </button></div></div>';
            $('.optionsArea').append(optionsEntry);
            $('.optionsArea div.option-value button.removeEntries[id="btn'+counter+'"]').on('click', function(evt) {
                evt.preventDefault();
                $(evt.target).parent('div').remove();
                //counter--;
                $('#counter').val(--counter);
            });
            $('#counter').val(counter++);
        });

        if(model)
        {
            $.each(model.optionValues, function(idx, val) {                
                var optionsEntry = '<div class="option-value"><div class="form-group"><div class="col-sm-4"><input type="text" name="val'+counter+'" id="val' + counter + '" value="' + this.value + '" class="form-control"></div><div class="col-sm-4"><input type="text" name="text'+counter+'" id="text'+counter+'" value="' + this.text + '" class="form-control"></div><button type="button" id="btn'+counter+'"class="removeEntries btn btn-default glyphicon glyphicon-remove">   </button></div></div>';                
                $('.optionsArea').append(optionsEntry);              
                $('.optionsArea div.option-value button.removeEntries[id="btn'+counter+'"]').on('click', function(evt) {
                    evt.preventDefault();
                    console.log("clicked");
                    $(evt.target).parent('div').remove();
                    //counter--;
                    $('#counter').val(--counter);
                    
                });
                console.log($('.optionsArea div.option-value button.removeEntries').get(counter - 1));
                //++counter;      
                $('#counter').val(counter++);
            }); 
        }                                   
    }  
    else 
    {
        if(model == null)
        {
            model = {};
        }

        model.optionValues = [];  
        for(var i = 1; i <= $('.option-value').length; i++)
        {
            var idx = $('.option-value input#val' + i).val();
            var text = $('.option-value input#text' + i).val();
            model.optionValues[idx] = {attribute_id:0, id:0, text:text, value:idx};
        }

        $('.optionsArea').remove();
        counter = 1;
        $('#counter').val(counter);
    }    
}

