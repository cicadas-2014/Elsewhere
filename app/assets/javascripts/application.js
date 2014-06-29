//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .



var ready = function() {
    // this updates the main image source whenever a thumbnail image is clicked    
    $('div.show_images').on('click', 'img.thumbnail', function(e) {
        e.preventDefault();
        var new_image_source = e.target.getAttribute('src').replace("_q.jpg", "_z.jpg")
        $('img#main_image').attr('src', new_image_source);
    });

    Highcharts.setOptions({
        chart: {
            backgroundColor: '#A4DEF4',
            height: 600,
            width: 1400
        },
        title: {
            style: {
                color: '#A4DEF4'
            }
        },
        legend: {
            title: {
                style: {
                    color: '#161A59'
                }
            }
        },
        colorAxis: {
            minColor: '#A9E455',
            maxColor: '#71A33D'
        }

    });

    $.getJSON('http://www.highcharts.com/samples/data/jsonp.php?filename=world-population-density.json&callback=?',
function (data) {

        // Initiate the chart
        $('#container').highcharts('Map', {


            mapNavigation: {
             
                buttonOptions: {
                    verticalAlign: 'bottom'
                },
                enableDoubleClickZoomTo: true
            },


            legend: {
                enabled: false
            },


            tooltip: {
                style: {
                            backgroundColor: 'black',
                            opacity: '1.0',
                            color: 'black',
                            fontSize: '12px',
                            padding: '8px',
                            border: 'black'
                        }
                    },

        //     chart: {
        //     events: {
        //         click: function(event) {
        //             alert ('x: '+ event.xAxis[0].value +', y: '+
        //                   event.yAxis[0].value);
        //         }

        //     }
        // },


        colorAxis: {
            min: 1,
            max: 1000,
            type: 'logarithmic',
            minColor: '#9BDA6A',
            maxColor: '#004D26',
        },


            plotOptions: {
                series: {
                    cursor: 'pointer',
                    events: {
                        click: function(event) {
                            console.log(event.point.code)
                            
                            $("#search").val(event.point.code);
                            $("#searchbutton").click();
                        }
                    }
                }
            },

            series : [{
                data : data,
                mapData: Highcharts.maps['custom/world'],
                joinBy: ['iso-a2', 'code'],
                borderColor: 'black',
                name: 'Country',
                states: {
                    hover: {
                        color: '#202930'
                    }
                },
                tooltip: {
                    pointFormat: '{point.name}'
                    
                }



            }]

        });

    });
};


$(document).ready(ready);
$(document).on('page:load', ready);


